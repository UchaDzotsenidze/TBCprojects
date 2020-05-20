//
//  Structures.swift
//  countries
//
//  Created by Ucha Dzotsenidze on 5/20/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import Foundation


struct CountryResponse: Codable{
    let name: String
    let capital: String
    let currencies: [currency]
    let borders: [String]
    let subregion: String
    let alpha3Code: String
    let flag: String
}

struct currency: Codable{
    let code: String?
    let name: String?
    let symbol: String?
}
