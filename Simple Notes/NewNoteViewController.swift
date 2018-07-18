//
//  NewNoteViewController.swift
//  Simple Notes
//
//  Created by Andrew  on 7/11/18.
//  Copyright © 2018 Andrew . All rights reserved.
//

import UIKit
import CoreData

class NewNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Observe text editing status, save when edeting did end
        NotificationCenter.default.addObserver(self, selector: #selector(saveNewNote(ncParam:)), name: NSNotification.Name.UITextViewTextDidEndEditing, object: nil)
        
        //Show keyboard instantly
        noteTextView.becomeFirstResponder()
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        if noteTextView.text.count >= 1 {
            //Show previous VC
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    @objc func saveNewNote(ncParam: NSNotification) {
        if noteTextView.text.count >= 1 {
            saveNoteToCoreData(note: noteTextView.text!)
        }
    }
    
    //MARK: - Save Notes to CoreData
    func saveNoteToCoreData(note: String) {
        
        //Prepare before saving to CoreData
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let notes = NotesEntity(context: context)
        notes.noteAttribute = noteTextView.text!
        
        //Save to CoreData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
}


