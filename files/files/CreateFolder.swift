//
//  CreateFolder.swift
//  files
//
//  Created by Ucha Dzotsenidze on 5/11/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class CreateFolder: UIViewController {
    
    @IBOutlet weak var AddField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.title = "Create Folder"
       
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        
        guard let foldername = AddField.text, AddField.hasText else { return alert(title: "Error", message: "Enter Folder name")}
        
        let CustomManager = openfilemanager.selfmanager
        
        CustomManager.createfolder(name: foldername)
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

    
    func alert(title:String, message: String)  {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }

}
