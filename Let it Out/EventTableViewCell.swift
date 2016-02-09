//
//  EventTableViewCell.swift
//  Let it Out
//
//  Created by Brandon Rich2 on 2/7/16.
//  Copyright © 2016 Infinite Donuts. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    var foo : String?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
