//
//  NoteCell.swift
//  LongNguyen_NoteiOS
//
//  Created by Nalou Nguyen on 7/10/17.
//  Copyright © 2017 Long Nguyen. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    
    var note: NoteModel! {
        didSet {
            titleLabel.text = note.title
            contentLabel.text = note.content
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
