//
//  SaveViewController.swift
//  podcasts
//
//  Created by Ucha Dzotsenidze on 5/13/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController {
    
    @IBOutlet weak var NameField: UITextField!
    
    @IBOutlet weak var DescField: UITextField!
    
    @IBOutlet weak var AddDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    @IBAction func onClick(_ sender: UIButton) {
        Save()
        self.navigationController?.popViewController(animated: true)
        
    }
    
}

extension SaveViewController{
    
    func Save(){
        let context = AppDelegate.coredatacontainer.viewContext
        
        let description = NSEntityDescription.entity(forEntityName: "PodCast", in: context)
        
        let pd = PodCast(entity: description!, insertInto: context)
        
        let minutes = Int(AddDatePicker.countDownDuration / 60)
        
        
        
        pd.name = NameField.text
        pd.text = DescField.text
        pd.time = String("\(minutes) Minutes")
    
        
        
        do{
            try context.save()
        }catch{}
        
    }
}
