//
//  addview.swift
//  whatsapp
//
//  Created by Ucha Dzotsenidze on 5/7/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

protocol Add{
    func addinfoatchat(array: ChatData)
}

class addview: UIViewController {
    
    @IBOutlet weak var AddNameField: UITextField!
    
    @IBOutlet weak var AddTextField: UITextView!
    
    var delegate: Add?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSendClick(_ sender: UIButton) {
        
        let image = "swift-og"
        let name = AddNameField.text!
        let text = AddTextField.text!
        
        
        let transport = ChatData(image: image, Name: name, text: text)
        
        delegate?.addinfoatchat(array: transport)
        
        self.navigationController?.popViewController(animated: true)
        
        
        AddNameField.text = ""
        AddTextField.text = ""
    }
    
}
