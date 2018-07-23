//
//  NoteViewController.swift
//  Simple Notes
//
//  Created by Andrew  on 7/15/18.
//  Copyright © 2018 Andrew . All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    
    @IBOutlet weak var noteTextView: UITextView!
    
    var text = String()
    var noteIndex = Int()
    var noteBefore = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        noteTextView.text = text
        noteTextView.isEditable = true
        noteBefore = noteTextView.text.count
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveNewNote(ncParam:)), name: NSNotification.Name.UITextViewTextDidEndEditing, object: nil)
    }
    
    @IBAction func shareButton(_ sender: Any) {
      let activityViewController = UIActivityViewController(activityItems: [noteTextView.text ?? "nil"], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    func saveNoteToCoreData(note: String) {
        
        //Prepare before saving to CoreData
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let notes = NotesEntity(context: context)
        notes.noteAttribute = noteTextView.text!
        
        //Save to CoreData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }

    func deleteNote() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let note = listOfNotes[noteIndex]
        context.delete(note)
        do {
            listOfNotes = try context.fetch(NotesEntity.fetchRequest())
        } catch {
            
        }
    }
    
    @objc func saveNewNote(ncParam: NSNotification) {
        
        if noteBefore != noteTextView.text.count {
            deleteNote()
            saveNoteToCoreData(note: noteTextView.text!)
        }
    }
}
