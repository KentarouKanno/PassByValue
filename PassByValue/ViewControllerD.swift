//
//  ViewControllerD.swift
//  PassByValue
//
//  Created by KentarOu on 2016/08/06.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

class ViewControllerD: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func back(sender: UIButton) {
        
        // 通知を送信
        NSNotificationCenter.defaultCenter().postNotificationName("TextUpdateNotification", object: textField.text!)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
