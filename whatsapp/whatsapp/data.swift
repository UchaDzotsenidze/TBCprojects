//
//  data.swift
//  whatsapp
//
//  Created by Ucha Dzotsenidze on 5/7/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import Foundation


struct date {
    var day: String
    var month: String
    var year: String
    
    static func retdate(day: Int, month: Int, year: Int) -> String{
        return "\(day)/\(month)/\(year)"
    }
}


struct datastruct{
    
    var Number: String
    var Country : String
    var date: String
    
}

struct ChatData {
    var image: String
    var Name: String
    var text: String
}


var callsarr: [datastruct] = [
    datastruct(Number: "514438000", Country: "Georgia", date: "wednesday"),
    datastruct(Number: "9124552935", Country: "USA", date: "friday"),
    datastruct(Number: "123513352", Country: "spain", date: "sunday"),
    datastruct(Number: "34362875332", Country: "New Zeland", date: "wednesday"),
    datastruct(Number: "6158832994", Country: "France", date: "monday"),
    datastruct(Number: "514438000", Country: "Georgia", date: "wednesday"),
    datastruct(Number: "9124552935", Country: "USA", date: "friday"),
    datastruct(Number: "123513352", Country: "spain", date: "sunday"),
    datastruct(Number: "514438000", Country: "Georgia", date: "wednesday"),
    datastruct(Number: "34362875332", Country: "New Zeland", date: "wednesday"),
    datastruct(Number: "9124552935", Country: "USA", date: "friday"),
    datastruct(Number: "6158832994", Country: "France", date: "monday"),
    datastruct(Number: "123513352", Country: "spain", date: "sunday"),
    datastruct(Number: "34362875332", Country: "New Zeland", date: "wednesday"),
    datastruct(Number: "6158832994", Country: "France", date: "monday"),
    
]

var chatsarr: [ChatData] = []


