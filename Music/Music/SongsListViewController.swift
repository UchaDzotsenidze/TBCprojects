//
//  SongsListViewController.swift
//  Music
//
//  Created by Ucha Dzotsenidze on 5/19/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class SongsListViewController: UIViewController {
    
    @IBOutlet weak var SongsTAbleView: UITableView!
    
    @IBOutlet weak var InfoLabel: UILabel!
    
    var temp = ""
    var songs: [songs] = []
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        InfoLabel.text = temp
        SongsTAbleView.delegate = self
        SongsTAbleView.dataSource = self
        
        print(get())
    }
    
    func get(){
        let url = URL(string: "http://www.mocky.io/v2/5ec3ca1c300000e5b039c407")!
        URLSession.shared.dataTask(with: url)
        { (data, res, err) in
            guard let unwrappedData = data else {return}
        
            do {
                let decoder = JSONDecoder()
            
                let response = try decoder.decode(allsongs.self, from: unwrappedData)
                self.songs.append(contentsOf: response.data)
                
            
                DispatchQueue.main.async {
                    self.SongsTAbleView.reloadData()
                }
            
            
            } catch{print(error.localizedDescription)}
        
        }.resume()

    }
}

extension SongsListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count - 1 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = SongsTAbleView.dequeueReusableCell(withIdentifier: "Songs_cell", for: indexPath) as! SongsCell
        
        let row = songs[indexPath.row]
        
        
        for x in row.songs{
            for y in x{
                cell.SongLabel.text = y.value
            }
        }
        
        
       return cell
    }
    
    
}
