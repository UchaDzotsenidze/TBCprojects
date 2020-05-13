//
//  MainViewCell.swift
//  podcasts
//
//  Created by Ucha Dzotsenidze on 5/13/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit
import CoreData

class MainViewCell: UITableViewCell {
    
    
    @IBOutlet weak var NameCellLabel: UILabel!
    
    @IBOutlet weak var descCellLabel: UILabel!
    
    @IBOutlet weak var DurationCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
