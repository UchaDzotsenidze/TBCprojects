//
//  ViewController.swift
//  table
//
//  Created by Ucha Dzotsenidze on 4/29/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: UIButton) {
        
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
}

