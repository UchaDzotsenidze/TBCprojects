//  secondviewcontroller.swift
//  gallery
//
//  Created by Ucha Dzotsenidze on 5/5/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.

import UIKit

class secondviewcontroller: UIViewController {
    
    let animal = ["dunno", "tiger", "monkey", "leopard"]
    let cars = ["bmw", "ferrari", "pagani", "koenigsegg"]
    let movies = ["future", "inception", "wars", "club"]

    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    var about = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
    }
    
    
}

extension secondviewcontroller: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "second_cell", for: indexPath) as! secondcell
        
        
        if about == "bmw"{
            
            cell.secondCellImage.image = UIImage(named: cars[indexPath.row])
        } else if about == "dunno" {
            cell.secondCellImage.image = UIImage(named: animal[indexPath.row])
        } else if about == "wars" {
                   cell.secondCellImage.image = UIImage(named: movies[indexPath.row])
               }
        
            
        
        
        return cell
    }
    
    
}

//extension secondviewcontroller: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        <#code#>
//    }
//}
