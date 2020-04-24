//
//  ViewController.swift
//  login231
//
//  Created by Ucha Dzotsenidze on 4/24/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var image1: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.button1.layer.cornerRadius = 20
        self.image1.layer.cornerRadius = 10
    }

    @IBAction func onClick(_ sender: UIButton) {
        
        if username.text == "" || password.text == ""{
            let alert = UIAlertController(title: "შეცდომა", message: "გთხოვთ შეიტანოთ ყველა მონაცემი", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel, handler: nil))                       
            self.present(alert, animated: true)
        }
    
        else{
            let alert = UIAlertController(title: "გილოცავთ", message: "წარმატებით გაიარეთ რეგისტრაცია", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "დახურვა", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
}

