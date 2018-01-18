//
//  ViewController.swift
//  recognizeForceTouch
//
//  Created by Mattias te Wierik on 18-01-18.
//  Copyright © 2018 Mattias te Wierik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        let touch: UITouch = touches.first as! UITouch
        
        forceLabel.text = "\(touch.force)"
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        forceLabel.text = "0.0"
    }


}

