//
//  ViewController.swift
//  mpushclient
//
//  Created by Ohashi Yusuke on 8/29/15.
//  Copyright © 2015 Ohashi Yusuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customValueTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "renderText:", name: MPushNotificationDidReceiveAPNS, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func renderText(notification:NSNotification) {
        if notification.object != nil {
            let userinfo = notification.object as! Dictionary<String, AnyObject>
            self.customValueTextView.text = userinfo.description
        }
    }
}

