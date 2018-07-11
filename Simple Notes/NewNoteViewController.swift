//
//  NewNoteViewController.swift
//  Simple Notes
//
//  Created by Andrew  on 7/11/18.
//  Copyright © 2018 Andrew . All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {

    @IBOutlet weak var newNoteTextView: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    @IBAction func doneButton(_ sender: Any) {
        
    }
    

}
