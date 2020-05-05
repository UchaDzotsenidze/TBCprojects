//
//  ViewController.swift
//  gallery
//
//  Created by Ucha Dzotsenidze on 5/5/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit




class ViewController: UIViewController {

    
    @IBOutlet weak var imageview: UIImageView!
    
    
    @IBOutlet weak var firstcollectionview: UICollectionView!
    
    
    
    var firstarray = ["bmw", "dunno", "wars"]
    var names = ["cars", "animals", "movies"]
    var collection: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstcollectionview.delegate = self
        firstcollectionview.dataSource = self
        
        
        imageview.isUserInteractionEnabled = true
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(self.imageClicked))
        imageview.addGestureRecognizer(tapgesture)
    }
    
    
    
    @objc func imageClicked(){
        if imageview.image == UIImage(named: "bmw"){
            
            collection = "bmw"
        }  else if imageview.image == UIImage(named: "dunno"){
            collection = "dunno"
            
        } else if imageview.image == UIImage(named: "wars"){
            collection = "wars"
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(identifier: "goeshere") as! secondviewcontroller
        VC.about = collection
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
   
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let cell = collectionView.cellForItem(at: indexPath) as! firstcell
        
        
//        let indexPath = collectionView.indexPathsForSelectedItems?.last ?? IndexPath(item: 0, section: 0)
//        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition.centeredHorizontally)
//
        
        //let cell = collectionView.cellForItem(at: indexPath) as? firstcell {
            
       // }
        
        imageview.image = UIImage(named: firstarray[indexPath.row])

    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return firstarray.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "first_cell", for: indexPath) as! firstcell
        cell.firstimagecell.image = UIImage(named: firstarray[indexPath.row])
        cell.firstlabelcell.text =  names[indexPath.row]
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        //cell.backgroundColor = .lightGray
        
        
        return cell
    }
}

