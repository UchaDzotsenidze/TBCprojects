//
//  HystoryViewController.swift
//  slider
//
//  Created by Ucha Dzotsenidze on 5/22/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit
import CoreData

class HystoryViewController: UIViewController {
    @IBOutlet weak var HistoryTAbleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.HistoryTAbleView.delegate = self
        self.HistoryTAbleView.dataSource = self
        
    }
    



}

extension HystoryViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let context = AppDelegate.coredatacontainer.viewContext
        
        let request: NSFetchRequest<History> = History.fetchRequest()
        
        
        do{
            let result = try context.fetch(request)

            let tbl = result as? [NSManagedObject]
            return tbl!.count
        }catch{}
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "History_cell", for: indexPath) as! HistoryCell
        
        let context = AppDelegate.coredatacontainer.viewContext
        
        let request: NSFetchRequest<History> = History.fetchRequest()
        
        do{
            let result = try context.fetch(request)
            
            let ft = result as? [NSManagedObject]
            
            let rs = ft?[indexPath.row] as? History
            
        
            cell.resultLabel.text = rs?.result
            cell.scoreLabel.text = rs?.usernumber
            cell.randIntLabel.text = rs?.randomint
            
            
        } catch{}
        
        return cell
    }
    
    
}
