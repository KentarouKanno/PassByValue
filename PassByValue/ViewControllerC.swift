//
//  ViewControllerC.swift
//  PassByValue
//
//  Created by KentarOu on 2016/08/06.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

class ViewControllerC: UIViewController {
    
    // Closure Instance
    var closuer: (String -> ())!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func back(sender: UIButton) {
        
        // Closure
        closuer(textField.text!)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
