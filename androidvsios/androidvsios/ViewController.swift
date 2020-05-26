//
//  ViewController.swift
//  androidvsios
//
//  Created by Ucha Dzotsenidze on 5/26/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MainimageView: UIImageView!
    
    @IBOutlet weak var MainLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        observer()
        
    }

    @IBAction func onChooseClick(_ sender: UIButton) {
    }
    
    func observer(){
        NotificationCenter.default.addObserver(self, selector: #selector(self.guess), name: .ios, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.guess), name: .android, object: nil)
    }
    
    @objc func guess(notification: NSNotification){
        let android = notification.name == NSNotification.Name.ios
        
        let image = android ? UIImage(named: "1200px-Android_robot.svg")! : UIImage(named: "iOS-7-10-Emblem")
        let labeltext = android ? "android" : "ios"
        
        
        
        MainimageView.image = image
        MainLabel.text = labeltext
        
    }
}

extension Notification.Name{
    static let ios = NSNotification.Name("IOS")
    static let android = NSNotification.Name("ANDROID")
}
