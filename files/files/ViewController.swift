//
//  ViewController.swift
//  files
//
//  Created by Ucha Dzotsenidze on 5/11/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onClick(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(withIdentifier: "Create_folder")
        self.navigationController?.pushViewController(VC, animated: true)
        
    }
    
}


extension ViewController: UICollectionViewDelegate{
    
    
}
extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let customManager = openfilemanager.selfmanager
        let array = customManager.content(url: customManager.path)
        
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Add_Cell", for: indexPath) as! AddCollectionView
    
    
        let customManager = openfilemanager.selfmanager
        let array = customManager.content(url: customManager.path)[indexPath.row]
        cell.NameLabel.text = array.pathComponents.last!
        
        return cell
    }
    
}
