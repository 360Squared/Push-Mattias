//
//  ViewController.swift
//  notifications
//
//  Created by Mattias te Wierik on 29-11-17.
//  Copyright © 2017 Mattias te Wierik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let notificationManger = NotificationManager()
        notificationManger.registerForNotifications()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

