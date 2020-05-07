//
//  CallsCell.swift
//  whatsapp
//
//  Created by Ucha Dzotsenidze on 5/7/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class CallsCell: UITableViewCell {
    
    
    @IBOutlet weak var CallNumberLabel: UILabel!
    @IBOutlet weak var CallCountryLabel: UILabel!
    @IBOutlet weak var CallDateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
