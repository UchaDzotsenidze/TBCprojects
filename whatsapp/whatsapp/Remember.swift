//
//  remember.swift
//  whatsapp
//
//  Created by Ucha Dzotsenidze on 5/7/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import Foundation


class remmember{
    
    internal static let remembered = "remembered"
    
    
    
    static func firstremember(){
        UserDefaults.standard.set("1", forKey: remembered)
    }
    
    static func secondremember(){
        UserDefaults.standard.set("2", forKey: remembered)
    }
    
    static func thirdremember(){
           UserDefaults.standard.set("3", forKey: remembered)
       }
    
    static func isremembered() -> String{
        return UserDefaults.standard.string(forKey: remembered) ?? ""
    }
}
