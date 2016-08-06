//
//  ViewControllerB.swift
//  PassByValue
//
//  Created by KentarOu on 2016/08/06.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

// Protocol宣言
protocol ViewControllerBDelegate: class {
    func setLabel(str: String)
}


class ViewControllerB: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    // Delegate Instance
    weak var delegate: ViewControllerBDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func back(sender: UIButton) {
        
        // Call Delegate Method
        delegate?.setLabel(textField.text!)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
