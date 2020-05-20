//
//  ViewController.swift
//  countries
//
//  Created by Ucha Dzotsenidze on 5/20/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MainSearchBar: UISearchBar!
    @IBOutlet weak var MainTAbleView: UITableView!
    
    
    var Countries = [CountryResponse]()
    
    var temporarycountry: CountryResponse?
    var counter = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.MainSearchBar.delegate = self
        self.MainTAbleView.delegate = self
        self.MainTAbleView.dataSource = self
        
    }
    
    func get(text: String){
        let url = URL(string: "https://restcountries.eu/rest/v2/all")!
        URLSession.shared.dataTask(with: url)
        { (data, res, err) in
            guard let data = data else {return}
            
            do{
                let decoder = JSONDecoder()
                
                let countryresponse = try decoder.decode([CountryResponse].self, from: data)
                //self.Countries.append(contentsOf: countryresponse)
            
                if text != ""{
                    for item in countryresponse{
                        if item.name == text || item.capital == text{
                            self.temporarycountry = item
                            self.counter.append(1)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.MainTAbleView.reloadData()
                }
                
            } catch {print(error.localizedDescription)}
            
        }.resume()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MainTAbleView.dequeueReusableCell(withIdentifier: "Main_cell", for: indexPath) as! MainTableViewCell
        
        cell.NameLabel.text = temporarycountry?.name
        cell.CapitalLabel.text = temporarycountry?.capital
        
        for item in temporarycountry!.currencies{
            cell.CurrencyLabel.text = item.symbol
        }
        
        var borders = ""
        for item in temporarycountry!.borders{
        borders += " \(item)"
        }
        cell.BordersLabel.text = borders
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "Details_view") as! DetailsViewController
        
        VC.imageurl = temporarycountry?.flag as! String
        
        
        VC.tempcode = temporarycountry?.alpha3Code as! String
        VC.tempsubregion = temporarycountry?.subregion as! String
        
        self.navigationController?.pushViewController(VC, animated: true)
    }
}


extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        get(text: searchText)
        counter.removeAll()
    }
}
