//
//  ViewController.swift
//  swappeableTableViewCell
//
//  Created by Mattias te Wierik on 17-01-18.
//  Copyright © 2018 Mattias te Wierik. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var itemsToLoad: [String] = ["One", "Two", "Three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsToLoad.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "simpleTableCell", for: indexPath) as! SimpleTableViewCell
        cell.updateText(text: self.itemsToLoad[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let shareAction  = UITableViewRowAction(style: .normal, title: "Share") { (rowAction, indexPath) in
            print("Share Button tapped. Row item value = \(self.itemsToLoad[indexPath.row])")
        }
        let deleteAction  = UITableViewRowAction(style: .default, title: "Delete") { (rowAction, indexPath) in
            print("Delete Button tapped. Row item value = \(self.itemsToLoad[indexPath.row])")
        }
        shareAction.backgroundColor = UIColor.green
        return [shareAction,deleteAction]
    }

}



class SimpleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    func updateText(text: String) {
       nameLabel.text = text
    }
    
}
