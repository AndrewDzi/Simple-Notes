//
//  ViewController.swift
//  Simple Notes
//
//  Created by Andrew  on 7/10/18.
//  Copyright © 2018 Andrew . All rights reserved.
//

import UIKit
import CoreData



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listOfNotes = [NotesEntity]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath) as! NoteCell
        let note = listOfNotes[indexPath.row]
        cell.noteHeader.text = note.noteAttribute
        cell.noteText.text = note.noteAttribute
        return cell
    }
    
    //MARK: Cofigure slide-to-delete cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        if editingStyle == UITableViewCellEditingStyle.delete {
            let note = listOfNotes[indexPath.row]
            context.delete(note)
            do {
                listOfNotes = try context.fetch(NotesEntity.fetchRequest())
            } catch {
                
            }
        }
        tableView.reloadData()
    }
    
    //MARK: Update data when view did appear
    override func viewDidAppear(_ animated: Bool) {
        //getNotesFromCoreData()
        getNotesFromCoreData()
        tableView.reloadData()
    }

    
    //MARK: - CoreData
    
    //MARK: - GET Notes from CoreData
    func getNotesFromCoreData() {
       let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            listOfNotes = try context.fetch(NotesEntity.fetchRequest())
        } catch {
            print("Fetching Notes from CoreData are failed")
        }
    }
    
    //MARK: - Save Notes to CoreData
//    func saveNotesToCoreData() {
//        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
//
//        let notes = NotesEntity(context: context)
//        notes.noteAttribute = listOfNotes
    
        
        
        
        
        
//        let funds = NSEntityDescription.insertNewObject(forEntityName: "NotesEntity", into: context)
        
//        funds.setValue(listOfNotes, forKey: "notesAttribute")
//
//        do
//        {
//            try context.save()
//            print("*** Name DATA SAVED ***")
//        }
//        catch {
//
//        }
//    }
}



