//
//  ViewController.swift
//  siri
//
//  Created by Mattias te Wierik on 11-01-18.
//  Copyright © 2018 Mattias te Wierik. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        INPreferences.requestSiriAuthorization { status in
            if status == .authorized {
                print("Hey, Siri!")
            } else {
                print("Nay, Siri!")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

