//
//  NoteCell.swift
//  Simple Notes
//
//  Created by Andrew  on 7/14/18.
//  Copyright © 2018 Andrew . All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    
    @IBOutlet weak var noteHeader: UILabel!
    @IBOutlet weak var noteText: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
