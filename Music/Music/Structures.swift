//
//  Structures.swift
//  Music
//
//  Created by Ucha Dzotsenidze on 5/19/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import Foundation


struct band: Codable{
    let name    : String
    let img_url     : String
    let thumb1  : String
    let thumb2  : String
    let thumb3  : String
    let info    : String
    let genre   : String
    
}



struct allsongs: Codable {
    var data: [songs]
}

struct songs: Codable{
    let band: String
    let songs: [[String:String]]
}

