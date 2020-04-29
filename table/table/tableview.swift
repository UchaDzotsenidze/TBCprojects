//
//  tableview.swift
//  table
//
//  Created by Ucha Dzotsenidze on 4/29/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class tableview: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "userinfo", for: indexPath) as!
//        tableview
//
//        cell.finname.text = "sad"
//
//        return cell
        
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "userinfo")
        
        


        cell.textLabel!.numberOfLines = 0;
        for item in dataarray {
            cell.textLabel?.text = "Name : \(item.name)\nSurname : \(item.username)\nEmail : \(item.email)"
            
        }
        
        
        
        return cell
    }
    
    
    
    var dataarray:[userinfo] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
}
