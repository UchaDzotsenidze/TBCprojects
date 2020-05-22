//
//  ViewController.swift
//  podcasts
//
//  Created by Ucha Dzotsenidze on 5/13/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, move {
    func GetFilterFromFilterPage(time: Int, isfilter: Bool) {
        timeFilter = time
        isFiltered = isfilter
    }
    
    
    @IBOutlet weak var MainTableView: UITableView!
    
    
    var timeFilter = 0
    var isFiltered = false
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        MainTableView.delegate = self
        MainTableView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        MainTableView.reloadData()
        print(timeFilter)
    }

    @IBAction func OnAddClick(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "AddView")
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func onSharpClick(_ sender: UIBarButtonItem) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "Filter")
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "Details") as! DetailsViewController
        
        
        
        
        let context = AppDelegate.coredatacontainer.viewContext

                

                do{
                    let result = try context.fetch(request)

                    let pod = result as? [NSManagedObject]
                    
                    
                    let rs = pod?[indexPath.row] as? PodCast
                    
                    VC.tempn = rs!.name!
                    VC.tempd = rs!.text!
                    VC.tempdu = rs!.time!
                    
                }catch{}

        
        
        
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let context = AppDelegate.coredatacontainer.viewContext

        let request: NSFetchRequest<PodCast> = PodCast.fetchRequest()

        do{
            let result = try context.fetch(request)

            let pod = result as? [NSManagedObject]
            return pod!.count
        }catch{}

        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Main_View_Cell", for: indexPath) as! MainViewCell
        
        let context = AppDelegate.coredatacontainer.viewContext
        
        
        
       
        let request: NSFetchRequest<PodCast> = PodCast.fetchRequest()
        //request.predicate = NSPredicate(format: "time < %@", timeFilter as CVarArg)

    
       
        do{
            let result = try context.fetch(request)

            
            
//            for item in pod!{
//                if let p = item as? PodCast{
//                    cell.NameCellLabel.text = p.name
//                    cell.descCellLabel.text = p.text
//                    cell.descCellLabel.text = p.time
//                }
//            }
            
            let rs = pod?[indexPath.row] as? PodCast
            
            cell.NameCellLabel.text = rs?.name
            cell.descCellLabel.text = rs?.text
            cell.DurationCellLabel.text = rs?.time
            
        }catch{}
        
        
        
        return cell
    }
}
