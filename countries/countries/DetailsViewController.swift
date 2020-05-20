//
//  DetailsViewController.swift
//  countries
//
//  Created by Ucha Dzotsenidze on 5/20/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var DetailsImageView: UIImageView!
    @IBOutlet weak var CodeLabel: UILabel!
    @IBOutlet weak var subregionLabel: UILabel!
    
    var imageurl = ""
    var tempcode = ""
    var tempsubregion = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // MARK: მოძებნილი ქვეყნის დროშა უნდა გამოეტანა ამას მაგრამ ვერ გამოვიდა.
//        if let filePath = Bundle.main.path(forResource: imageurl, ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
//            DetailsImageView.contentMode = .scaleAspectFit
//            DetailsImageView.image = image
//        }
        
        CodeLabel.text = tempcode
        subregionLabel.text = tempsubregion
    }
    
}


//extension String {
//    func downloadImage(completion: @escaping (UIImage?) -> ()) {
//        guard let url = URL(string: self) else {return}
//        URLSession.shared.dataTask(with: url) { (data, res, err) in
//            guard let data = data else {return}
//            completion(UIImage(data: data))
//        }.resume()
//    }
//}
