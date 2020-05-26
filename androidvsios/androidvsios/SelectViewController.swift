//
//  SelectViewController.swift
//  androidvsios
//
//  Created by Ucha Dzotsenidze on 5/26/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onAndroidClick(_ sender: UIButton) {
        NotificationCenter.default.post(name: .ios, object: nil)
        dismiss(animated: true)
    }
    
    @IBAction func onIosClick(_ sender: UIButton) {
        NotificationCenter.default.post(name: .android, object: nil)
        dismiss(animated: true)
    }
}
