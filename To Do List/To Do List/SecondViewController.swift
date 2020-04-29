//
//  SecondViewController.swift
//  To Do List
//
//  Created by Srans022019 on 29/04/20.
//  Copyright © 2020 vikas. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var itemEntering: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    @IBAction func onTapSave(_ sender: Any) {
        
        if itemEntering.text!.count > 0 {
            
            let itemsObject = UserDefaults.standard.object(forKey: "content")
            
            var items = [String]()
            
            if let tempItems = itemsObject as? [String] {
                
                items = tempItems
                items.append(itemEntering.text!)
            }else{
                items = [itemEntering.text!]
            }
            
            
            UserDefaults.standard.set(items, forKey: "content")
            itemEntering.text = ""
            
        }else {
            
            let alert = UIAlertController(title: "Message", message: "Field is empty to update", preferredStyle: .alert)
            present(alert, animated: true, completion: nil)
            
            // Automatically disappear of alert.
            let disappear = DispatchTime.now() + 1 //time to delay
            // adding delay to mainthread
            DispatchQueue.main.asyncAfter(deadline: disappear) {
                alert.dismiss(animated: true, completion: nil)
            }
            
            
        }
        
    }
    
}

