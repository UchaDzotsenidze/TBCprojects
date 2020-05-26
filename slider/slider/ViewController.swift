//
//  ViewController.swift
//  slider
//
//  Created by Ucha Dzotsenidze on 5/22/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit
import CoreData

func randint() -> Int{
    return Int.random(in: 9...100)
}

class ViewController: UIViewController {
    @IBOutlet weak var RandomIntLabel: UILabel!
    @IBOutlet weak var MainSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    
    var randomint = randint()
    
    var resultsarray = ["Good", "Not Bad", "You are somewhere on mars"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RandomIntLabel.text = String(randomint)
    }

    @IBAction func onGuessClick(_ sender: Any) {
        
        var invalue = Int(MainSlider.value)
        
        if invalue >= randomint - 10 && invalue <= randomint + 10{
            
            Save(randnumber: randomint, usernumber: invalue, result: resultsarray[0])
            resultLabel.text = resultsarray[0]
            
        }else if invalue >= randomint - 20 && invalue <= randomint + 20{
            Save(randnumber: randomint, usernumber: invalue, result: resultsarray[1])
            resultLabel.text = resultsarray[1]
        }else{
            Save(randnumber: randomint, usernumber: invalue, result: resultsarray[2])
            resultLabel.text = resultsarray[2]
        }
        
        randomint = Int.random(in: 9...100)
        
    }
    
    
 
    @IBAction func onHistoryClick(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "Hystory_view")
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
    
    
    
    
}


extension ViewController{
    
    func Save(randnumber: Int, usernumber: Int, result: String){
        
        let context = AppDelegate.coredatacontainer.viewContext
        
        let description = NSEntityDescription.entity(forEntityName: "History", in: context)
        
        let pd = History(entity: description!, insertInto: context)
        
        
        
        pd.result = result
        pd.randomint = String(randnumber)
        pd.usernumber = String(usernumber)
    
                
        do{
            try context.save()
        }catch{}
        
    }
}


