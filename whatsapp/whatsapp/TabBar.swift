//
//  TabBar.swift
//  whatsapp
//
//  Created by Ucha Dzotsenidze on 5/7/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.selectedIndex = 1
         
        
        if remmember.isremembered() == "1"{
            self.selectedIndex = 0
        } else if remmember.isremembered() == "2"{
            self.selectedIndex = 1
        } else if remmember.isremembered() == "3"{
            self.selectedIndex = 2
        }
        
    }

}
