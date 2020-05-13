//
//  DetailsViewController.swift
//  podcasts
//
//  Created by Ucha Dzotsenidze on 5/13/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var DescLabel: UILabel!
    
    @IBOutlet weak var DurationLabel: UILabel!
    
    
    
    var tempn = ""
    var tempd = ""
    var tempdu = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NameLabel.text = tempn
        DescLabel.text = tempd
        DurationLabel.text = tempdu
    }
}


