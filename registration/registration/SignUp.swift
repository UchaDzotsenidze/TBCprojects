//
//  SignUp.swift
//  registration
//
//  Created by Ucha Dzotsenidze on 5/6/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit


class SignUp: UIViewController {
    
    @IBOutlet weak var UpNameField: UITextField!
    
    @IBOutlet weak var UpEmailField: UITextField!
    
    @IBOutlet weak var UpPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func alert(title:String, message: String)  {
                   let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                   alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
                   self.present(alert, animated: true)
          }
    

    @IBAction func OnSignUpClick(_ sender: UIButton) {
        guard let Name = UpNameField.text, UpNameField.hasText else{
            return alert(title: "Error 404", message: "Fill out Name")
        }
        
        guard let Email = UpEmailField.text, UpEmailField.hasText else{
            return alert(title: "Error 404", message: "Fill out Email")
        }
        
        guard let Password = UpPasswordField.text, UpPasswordField.hasText else{
            return alert(title: "Error 404", message: "Fill out Password")
        }
        
        userdata.SaveUserName(value: Name)
        userdata.SaveEmail(value: Email)
        userdata.SavePassword(value: Password)
        userdata.Saveletter(value: "")
        userdata.SaveColor(value: "")
        
        
        UpNameField.text = ""
        UpEmailField.text = ""
        UpPasswordField.text = ""
        
    
        self.navigationController?.popViewController(animated: true)
        
    }
}
