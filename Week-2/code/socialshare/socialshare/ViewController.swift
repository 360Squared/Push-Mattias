//
//  ViewController.swift
//  socialshare
//
//  Created by Mattias te Wierik on 06-12-17.
//  Copyright © 2017 Mattias te Wierik. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet var messageField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Share(_ sender: UIButton) {
        let share = [messageField.text]
        let activityViewController = UIActivityViewController(activityItems: share, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}

