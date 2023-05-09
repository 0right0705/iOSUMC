//
//  ViewController.swift
//  DelegatePattern
//
//  Created by 최영우 on 5/6/23.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var enteredLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    
    
    
    @IBAction func buttonClicked(_ sender: Any) {
        enteredLabel.text = textField.text;
    }
    func textFieldShouldReturn(_ textField: UITextField)-> Bool {
        enteredLabel.text = textField.text
        return true
    }


}

