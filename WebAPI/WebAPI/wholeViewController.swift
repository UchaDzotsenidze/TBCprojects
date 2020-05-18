//
//  wholeViewController.swift
//  WebAPI
//
//  Created by Ucha Dzotsenidze on 5/18/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

struct Joke: Codable{
    let categories    : [String]
    let create        : String
    let icon          : String
    let id            : String
    let update        : String
    let url           : String
    let joke          : String
    
        
    enum CodingKeys: String, CodingKey{
        case categories
        case create  = "created_at"
        case icon = "icon_url"
        case id
        case update = "updated_at"
        case url
        case joke = "value"
    }
}

class wholeViewController: UIViewController {
    
    var joke : String?
    var color: String?

    @IBOutlet weak var NorrisJokeL: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        get()
        view.backgroundColor = hexStringToUIColor(hex: color!)
    }
    
    func get(){
        let url = URL(string: "https://api.chucknorris.io/jokes/random?category=dev")!
        URLSession.shared.dataTask(with: url)
        { (data, res, err) in
            
            guard let data = data else {return}
            
            do{
                let decoder = JSONDecoder()
                
                let userresponse = try decoder.decode(Joke.self, from: data)
                self.joke = userresponse.joke

                DispatchQueue.main.async {
                    self.NorrisJokeL.text = self.joke
                }
                
            } catch {print(error.localizedDescription)}
            
        }.resume()
    }


}
