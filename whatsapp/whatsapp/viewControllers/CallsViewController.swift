//
//  CallsViewController.swift
//  whatsapp
//
//  Created by Ucha Dzotsenidze on 5/7/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class CallsViewController: UIViewController {

    
    @IBOutlet weak var CallsTableView: UITableView!
    
    override func viewWillDisappear(_ animated: Bool) {
        remmember.firstremember()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CallsTableView.delegate = self
        CallsTableView.dataSource = self
        
    }
    
    
    
}

extension CallsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        callsarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Callcell", for: indexPath) as! CallsCell
        
        cell.CallNumberLabel.text = callsarr[indexPath.row].Number
        cell.CallCountryLabel.text = callsarr[indexPath.row].Country
        cell.CallDateLabel.text = callsarr[indexPath.row].date
        
        return cell
        
    }
    
    
}
