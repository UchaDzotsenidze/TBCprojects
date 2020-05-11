//
//  ChatViewController.swift
//  whatsapp
//
//  Created by Ucha Dzotsenidze on 5/7/20.
//  Copyright © 2020 Ucha Dzotsenidze. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, Add {
    
    
    
    
    func addinfoatchat(array: ChatData) {
        chatsarr.append(array)
        ChatTableView.reloadData()
    }
    
    @IBOutlet weak var ChatTableView: UITableView!
    
    override func viewWillDisappear(_ animated: Bool) {
        remmember.secondremember()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ChatTableView.delegate = self
        ChatTableView.dataSource = self
    }
    


    
    
    
    @IBAction func OnAddClick(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let  VC = storyboard.instantiateViewController(identifier: "Add_page")
        
        if let adddata = VC as? addview{adddata.delegate = self}
        
        
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
    
   
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chatsarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Chatcell", for: indexPath) as! ChatCell
        
        
        
//        cell.ChatImageView.image = UIImage(named: chatsarr[indexPath.row].image)
        cell.ChatNameLabel.text = chatsarr[indexPath.row].Name
        cell.ChatTextLabel.text = chatsarr[indexPath.row].text
    
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let  VC = storyboard.instantiateViewController(identifier: "All_info") as? Allinfo else { return }
        
        VC.allmessagelabel.text = chatsarr[indexPath.row].text
        VC.allnamelabel.text = chatsarr[indexPath.row].text
                    
        self.navigationController?.pushViewController(VC, animated: true)
        
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let Id = segue.identifier, Id == "show_id" {
//            if let instance = segue.destination as? Allinfo{
//                instance.allmessagelabel.text = chatsarr
//            }
//        }
//
//    }
    
}

