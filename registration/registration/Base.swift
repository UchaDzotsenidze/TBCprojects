//
//  Base.swift
//  registration
//
//  Created by Ucha Dzotsenidze on 5/6/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import Foundation


class userdata{
    
    internal static let Username = "Username"
    internal static let Email = "Email"
    internal static let Password = "Password"
    internal static let Color = "Color"
    internal static let letter = "Letter"
    
    internal static let Launched = "Launched"
    
    
    
    static func SaveUserName(value: String){
        UserDefaults.standard.set(value, forKey: Username)
    }
    
    static func ReturnUserName() -> String{
            return UserDefaults.standard.string(forKey: Username) ?? ""
       }
    
    
    static func SaveEmail(value: String){
        UserDefaults.standard.set(value, forKey: Email)
    }
    
    static func ReturnEmail() -> String{
            return UserDefaults.standard.string(forKey: Email) ?? ""
       }
    
    static func SavePassword(value: String){
        UserDefaults.standard.set(value, forKey: Password)
    }
    
    static func ReturnPassword() -> String{
            return UserDefaults.standard.string(forKey: Password) ?? ""
       }
    
    static func SaveColor(value: String){
        UserDefaults.standard.set(value, forKey: Color)
    }
    
    static func ReturnColor() -> String{
            return UserDefaults.standard.string(forKey: Color) ?? ""
       }
    
    static func Saveletter(value: String){
        UserDefaults.standard.set(value, forKey: letter)
    }
    
    static func Returnletter() -> String{
            return UserDefaults.standard.string(forKey: letter) ?? ""
       }
    
    
    
    static func lunchedapp(){
        UserDefaults.standard.set(true, forKey: Launched)
    }
    
    static func unlunchedapp(){
        UserDefaults.standard.set(false, forKey: Launched)
    }
    
    static func islunchedapp() -> Bool{
        return UserDefaults.standard.bool(forKey: Launched)
    }
    
}
