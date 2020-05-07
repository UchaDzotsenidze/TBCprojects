//
//  SettingsViewController.swift
//  whatsapp
//
//  Created by Ucha Dzotsenidze on 5/7/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var OldPassField: UITextField!
    
    @IBOutlet weak var NewPassField: UITextField!
    
    @IBOutlet weak var RepNewPassField: UITextField!
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        remmember.thirdremember()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func OnSignOut(_ sender: UIButton) {
    

    }
    
}
