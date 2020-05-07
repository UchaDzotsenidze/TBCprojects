//
//  ChatCell.swift
//  whatsapp
//
//  Created by Ucha Dzotsenidze on 5/7/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var ChatImageView: UIImageView!
    
    @IBOutlet weak var ChatNameLabel: UILabel!
    
    
    @IBOutlet weak var ChatTextLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ChatImageView.layer.cornerRadius = 60
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
