//
//  ViewController.swift
//  programmaticallyElement
//
//  Created by Mattias te Wierik on 08-12-17.
//  Copyright © 2017 Mattias te Wierik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var stack: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let newTextfield = UITextField()
        
        newTextfield.text = "Hoi!"
        
        stack.addArrangedSubview(newTextfield)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

