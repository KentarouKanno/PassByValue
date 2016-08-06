//
//  ViewController.swift
//  PassByValue
//
//  Created by KentarOu on 2016/08/06.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

enum NextViewController: Int {
    case vcB,vcC,vcD
}

class ViewControllerA: UIViewController, ViewControllerBDelegate {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 通知を登録
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.update(_:)), name: "TextUpdateNotification", object: nil)
    }
    
    deinit {
        // 通知を解除
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    // 画面遷移
    @IBAction func pushNext(sender: UIButton) {
        var segueID: String
        switch NextViewController(rawValue: sender.tag)! {
        case .vcB: segueID = "delegate"
        case .vcC: segueID = "closure"
        case .vcD: segueID = "notification"
        }
        performSegueWithIdentifier(segueID, sender: nil)
    }
    
    // Call Notification
    func update(notification: NSNotification?) {
        setLabel(notification?.object as! String)
    }
    
    func setLabel(str: String) {
        resultLabel.text = str
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let next = segue.destinationViewController as? ViewControllerB  {
            // Delegateを自身に設定
            next.delegate = self
        }
        
        if let next = segue.destinationViewController as? ViewControllerC  {
            next.closuer = { (text) in
                // Closure で呼ばれた値をラベルに設定
                self.setLabel(text)
            }
        }
    }
}

