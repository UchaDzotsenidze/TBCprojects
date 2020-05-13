//
//  FilterViewController.swift
//  podcasts
//
//  Created by Ucha Dzotsenidze on 5/13/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit


protocol move {
    func GetFilterFromFilterPage(time: Int, isfilter: Bool)
}

class FilterViewController: UIViewController {
    
    @IBOutlet weak var filterField: UITextField!
    
    var delegate: move?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func onSetClick(_ sender: UIButton) {
        
        var intx = Int(filterField.text!)
        delegate?.GetFilterFromFilterPage(time: intx!, isfilter: true)
            
        
                
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
