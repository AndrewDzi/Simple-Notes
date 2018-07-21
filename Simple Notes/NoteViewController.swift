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
    
    override func viewDidLoad() {
        noteTextView.text = text
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
