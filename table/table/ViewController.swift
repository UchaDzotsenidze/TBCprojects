//
//  ViewController.swift
//  table
//
//  Created by Ucha Dzotsenidze on 4/29/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var namefield: UITextField!
    
    @IBOutlet weak var givennamefield: UITextField!
    
    @IBOutlet weak var emaillabel: UITextField!
    
    @IBOutlet weak var sexfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

    @IBAction func onClick(_ sender: UIButton) {
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    var ragacarray: [userinfo] = []
    
    @IBAction func onClickregistration(_ sender: UIButton) {
        
        let name1 = namefield.text ?? ""
        let givenname1 = givennamefield.text ?? ""
        let email1 = emaillabel.text ?? ""
        // MARK: ეს ვერ გამოვიდა ნილზე იყო პრობლემა და ვერ გამოსწორე
        //let sex1 = sexfield.text ?? ""
        
        
        
        let usrinf = userinfo(name: name1, username: givenname1, email: email1 /*sex: sex1*/)
        
        ragacarray.append(usrinf)
        
        namefield.text = ""
        givennamefield.text = ""
        emaillabel.text = ""
        //sexfield.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! tableview
        
        vc.dataarray = ragacarray
        
    }
    
}


