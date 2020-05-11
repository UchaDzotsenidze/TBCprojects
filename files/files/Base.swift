//
//  Base.swift
//  files
//
//  Created by Ucha Dzotsenidze on 5/11/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import Foundation

class openfilemanager{
    
    let fm = FileManager.default
    
    static let selfmanager = openfilemanager()
    
    
    private init() {}
    
    var path: URL {
        return try! fm.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
    }
    
    func createfolder(name: String)
    {
        let createpath = path.appendingPathComponent(name)
        
        try! fm.createDirectory(at: createpath, withIntermediateDirectories: false, attributes: nil)
    }
    
    func createfile(name: String, text: String, format: Format,path: URL){
        let filepath = path.appendingPathComponent("\(name).\(Format.RawValue())")
        
        do{
            try text.write(to: filepath, atomically: true, encoding: .utf8)
        }
        catch let error{
            print(error)
        }
    }
    
    
        enum Format: String {
        case txt    = "txt"
        case swift  = "swift"
        case cpp    = "cpp"
        case python = "py"
    }
    
    func content(url: URL) -> [URL]{
        return try! fm.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
    }
    
    func read(url: URL) -> String{
        return try! String(contentsOf: url)
    }
    
    func delete(url: URL) {
        
        do{
            try fm.removeItem(at: url)
        }
        catch let error{
            print(error)
        }
    }
}


class UDManager{
    internal static let Counter = "counter"
    
    static func save(val: String){
        UserDefaults.standard.set(val, forKey: Counter)
    }
    
    static func ret() -> String{
        return UserDefaults.standard.string(forKey: Counter) ?? "0"
    }
}
