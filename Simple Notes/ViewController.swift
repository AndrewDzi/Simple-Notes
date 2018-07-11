//
//  ViewController.swift
//  Simple Notes
//
//  Created by Andrew  on 7/10/18.
//  Copyright © 2018 Andrew . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listOfNotes = ["test", "test2", "Test3"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (listOfNotes.count)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = listOfNotes[indexPath.row]
        return (cell)
    }
    
    //MARK: Cofigure slide-to-delete cell
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            listOfNotes.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Update data when view appear
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    


}

