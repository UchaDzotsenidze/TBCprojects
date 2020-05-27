//
//  ViewController.swift
//  animation
//
//  Created by Ucha Dzotsenidze on 5/27/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MainTableView: UITableView!
    
    
    var icons = ["icon1","icon2","icon3","icon4"]
    var names = ["Main With Flag","Woman At Board","Globe","Boom Boom"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MainTableView.delegate = self
        self.MainTableView.dataSource = self
    }
    
    
    
    
    func animation(index: Int){
            
        let x = view.frame.width / 2 - 60
        let y = view.frame.height + 70
        
        
        
        let image = UIImageView(frame: CGRect(x: x, y: y, width: 120, height: 120))
        
        view.addSubview(image)
        
        image.image = UIImage(named: icons[index])
        
        image.backgroundColor = .tertiaryLabel
        image.layer.cornerRadius = 10
        
        
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.08){
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: [], animations: {
                    image.frame.origin.y =  670
                })
            }
            

        }) { (f) in
            do{ sleep(1)
            UIView.transition(with: image, duration: 1, options: .transitionFlipFromBottom, animations: {
                image.alpha = 0
                
            })
                
            }
            
        }
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return icons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Main_cell", for: indexPath) as! TableViewCell
        
        cell.NameLabel.text = names[indexPath.row]
        cell.MainImageView.image = UIImage(named: icons[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        animation(index: indexPath.row)
        
    }
    
    
}
