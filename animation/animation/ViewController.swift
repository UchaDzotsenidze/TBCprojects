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
    
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var ChooseItemLabel: UILabel!
    
    @IBOutlet weak var ManWithFlagImage: UIImageView!
    @IBOutlet weak var WomanAtBoardImage: UIImageView!
    @IBOutlet weak var GlobeImage: UIImageView!
    
    @IBOutlet weak var BoomImage: UIImageView!
    @IBOutlet weak var addimage: UIImageView!
    
    @IBOutlet weak var height: NSLayoutConstraint!
    
    
    var isclicked = false
    
    var names = ["Man With Flag","Woman At Board","Globe","Boom Boom"]
    
    var adds = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MainTableView.delegate = self
        self.MainTableView.dataSource = self
        
        ChooseItemLabel.isHidden = true
        ManWithFlagImage.isHidden = true
        WomanAtBoardImage.isHidden = true
        GlobeImage.isHidden = true
        BoomImage.isHidden = true

        height.constant = 70
        
        MainTableView.reloadData()
    }
    
    
  
    @IBAction func onAddClick(_ sender: UITapGestureRecognizer) {
        
                
        if isclicked == false{
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            self.isclicked = true
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.08){
                
                self.ChooseItemLabel.isHidden = false
                self.ManWithFlagImage.isHidden = false
                self.WomanAtBoardImage.isHidden = false
                self.GlobeImage.isHidden = false
                self.BoomImage.isHidden = false
                self.height.constant = 200
                
                
                
                UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 15, options: [], animations: {
                    self.MainTableView.frame.origin.y = 200
                    
                    self.ChooseItemLabel.frame.origin.y = 70
                    self.ChooseItemLabel.frame.origin.x = 40
                    
                    self.addimage.frame.origin.x = 350
                    self.addimage.frame.origin.y = 70
                    self.addimage.transform = CGAffineTransform(rotationAngle: 0.80)
                
                    
                })
                
            }
            
        })
            
        }else if isclicked == true
        {
            UIView.transition(with: self.MainView, duration: 1, options: .transitionFlipFromBottom, animations: {
                self.addimage.frame.origin.x = 380
                self.addimage.frame.origin.y = 45
            })
            self.MainTableView.frame.origin.y = 50
            self.ChooseItemLabel.isHidden = true
            self.ManWithFlagImage.isHidden = true
            self.WomanAtBoardImage.isHidden = true
            self.GlobeImage.isHidden = true
            self.BoomImage.isHidden = true
            self.height.constant = 70
            
            
            self.isclicked = true
        }
        
    }

    
    @IBAction func onManClick(_ sender: UITapGestureRecognizer) {
        adds.append("Man With Flag")
        MainTableView.reloadData()
    }
    
    @IBAction func onWomanClick(_ sender: UITapGestureRecognizer) {
        
        adds.append("Woman At Board")
        MainTableView.reloadData()
    }
    
    @IBAction func onGlobeClick(_ sender: UITapGestureRecognizer) {
        
        adds.append("Globe")
        MainTableView.reloadData()
    }
    
    @IBAction func onBoom(_ sender: UITapGestureRecognizer) {
        adds.append("Boom Boom")
        MainTableView.reloadData()
    }
    
    func animation(index: Int){
            
        let x = view.frame.width / 2 - 60
        let y = view.frame.height + 70
        
        
        
        let image = UIImageView(frame: CGRect(x: x, y: y, width: 120, height: 120))
        
        view.addSubview(image)
        
        image.image = UIImage(named: adds[index])
        
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
        return adds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Main_cell", for: indexPath) as! TableViewCell
        
        cell.NameLabel.text = adds[indexPath.row]
        cell.MainImageView.image = UIImage(named: adds[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        animation(index: indexPath.row)
        
    }
    
    
}
