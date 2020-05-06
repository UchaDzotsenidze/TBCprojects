//
//  UserPage.swift
//  registration
//
//  Created by Ucha Dzotsenidze on 5/6/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class UserPage: UIViewController {
    
    @IBOutlet weak var UserPageName: UILabel!
    
    @IBOutlet weak var UserPageEmail: UILabel!
    
    @IBOutlet weak var UserPageTextView: UITextView!
    
    @IBOutlet weak var UserPageSegment: UISegmentedControl!
    
    
    
    func alert(title:String, message: String)  {
             let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK!", style: .cancel, handler: nil))
             self.present(alert, animated: true)
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        let Letter = UserPageTextView.text ?? ""
        userdata.Saveletter(value: Letter)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserPageName.text = userdata.ReturnUserName()
        UserPageEmail.text = userdata.ReturnEmail()
        UserPageTextView.text = userdata.Returnletter()
    }
    
    @IBAction func onSegmentChange(_ sender: UISegmentedControl) {
        
        switch  UserPageSegment.selectedSegmentIndex{
        case 0:
            view.backgroundColor = .systemIndigo
            userdata.SaveColor(value: ".systemIndigo")
        case 1:
            view.backgroundColor = .magenta
            userdata.SaveColor(value: ".magenta")
        case 2:
            view.backgroundColor = .link
            userdata.SaveColor(value: ".link")
        case 3:
            view.backgroundColor = .systemTeal
            userdata.SaveColor(value: ".systemTeal")
        default:
            break
        }
    }
    
    
    
    @IBAction func signOut(_ sender: UIButton) {
        
        userdata.unlunchedapp()
        self.navigationController?.popViewController(animated: true)
    }
    

}
