//
//  FirstViewController.swift
//  To Do List
//
//  Created by Srans022019 on 29/04/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var table: UITableView!
    
    var item = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = item[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 0, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0
        
        UIView.animate(withDuration: 2.0) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            item.remove(at: indexPath.row)
            
            table.reloadData()
            
            UserDefaults.standard.set(item, forKey: "content")
        }
        
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        let itemObject = UserDefaults.standard.object(forKey: "content")
        
        if let tempItem = itemObject as? [String] {
            
            item = tempItem
        }
        
        table.reloadData()
    }


}

