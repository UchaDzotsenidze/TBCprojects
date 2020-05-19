//
//  ViewController.swift
//  Music
//
//  Created by Ucha Dzotsenidze on 5/19/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BandsViewCollection: UICollectionView!
    
    var bands: [band] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BandsViewCollection.delegate = self
        BandsViewCollection.dataSource = self
        
        get()
    }
    
    func get(){
        let url = URL(string: "http://www.mocky.io/v2/5ec3ab0f300000850039c29e")!
        URLSession.shared.dataTask(with: url)
        { (data, res, err) in
            guard let unwrappedData = data else {return}
            
            do {
                let decoder = JSONDecoder()
                
                let response = try decoder.decode([band].self, from: unwrappedData)
                self.bands.append(contentsOf: response)
                
                DispatchQueue.main.async {
                    self.BandsViewCollection.reloadData()
                }
                
                
            } catch{print(error.localizedDescription)}
            
        }.resume()
    }


}

extension ViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bands.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = BandsViewCollection.dequeueReusableCell(withReuseIdentifier: "Bands_Cell", for: indexPath) as! BandsCell
        
        let row = bands[indexPath.row]
        
        cell.BandNameLabel.text = row.name
        row.img_url.downloadImage {(image) in
            DispatchQueue.main.async {
                cell.BandImageView.image = image
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "Songs_list") as! SongsListViewController
        let row = bands[indexPath.row]
        VC.temp = row.info

        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth =  collectionView.frame.width / 2
        return CGSize(width: itemWidth - 20 - 20, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top:30, left: 20, bottom: 10, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}


extension String {
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: self) else {return}
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {return}
            completion(UIImage(data: data))
        }.resume()
    }
}
