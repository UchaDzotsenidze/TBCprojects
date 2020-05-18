//
//  ViewController.swift
//  WebAPI
//
//  Created by Ucha Dzotsenidze on 5/18/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

struct Userresponse: Codable {
    
    public var users: [User]
    
    enum CodingKeys: String, CodingKey {
           case users = "data"
    }

}
struct User: Codable{
    let id    : Int
    let name  : String
    let year  : Int
    let color : String
    let value : String
    
    
    enum CodingKeys: String, CodingKey{
        case id
        case name
        case year
        case color
        case value = "pantone_value"
    }
}

    class ViewController: UIViewController {

    @IBOutlet weak var MainCollectionView: UICollectionView!
    
    
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        MainCollectionView.delegate = self
        MainCollectionView.dataSource = self
        
        get()
    }

    func get(){
        let url = URL(string: "https://reqres.in/api/unknown")!
        URLSession.shared.dataTask(with: url)
        { (data, res, err) in
            guard let data = data else {return}
            
            do{
                let decoder = JSONDecoder()
                
                let userresponse = try decoder.decode(Userresponse.self, from: data)
                self.users.append(contentsOf: userresponse.users)
                
                DispatchQueue.main.async {
                    self.MainCollectionView.reloadData()
                }
                
                
                
                
            } catch {print(error.localizedDescription)}
            
        }.resume()
        
    }
}
    
extension ViewController: UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MainCollectionView.dequeueReusableCell(withReuseIdentifier: "Main_cell", for: indexPath) as! MainCell
        let user = users[indexPath.row]
        
        
        
        cell.ColorLabel.text = user.color
        cell.NameLabel.text = user.name
        cell.backgroundColor = hexStringToUIColor(hex: user.color)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "Whole_view") as! wholeViewController
        
        VC.color = users[indexPath.row].color
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

func hexStringToUIColor (hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }

    if ((cString.count) != 6) {
        return UIColor.gray
    }

    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

