//
//  ViewController.swift
//  registration
//
//  Created by Ucha Dzotsenidze on 5/6/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var NameField: UITextField!
    
    @IBOutlet weak var PasswordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if userdata.islunchedapp() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let  VC = storyboard.instantiateViewController(identifier: "User_page")
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    
    func alert(title:String, message: String)  {
             let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
             self.present(alert, animated: true)
    }
    
    
    
    @IBAction func onClick(_ sender: UIButton) {

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let VC = storyboard.instantiateViewController(identifier: "User_page")
        
        
        if NameField.text == "" && PasswordField.text == "" {
            alert(title: "Error", message: "Fill out form")
            }
        
        else if NameField.text == userdata.ReturnUserName() && PasswordField.text == userdata.ReturnPassword(){
            self.navigationController?.pushViewController(VC, animated: true)
        }
        else{
            alert(title: "Error", message: "Your account doesnot exist")
            
        }
        
        NameField.text = ""
        PasswordField.text = ""
    }
    
        

    @IBAction func onClickSign(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let VC = storyboard.instantiateViewController(identifier: "Sign_Up")
        
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
        
}
    
    
    
    
    

    


