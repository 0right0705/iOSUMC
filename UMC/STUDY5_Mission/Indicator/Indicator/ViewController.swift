//
//  ViewController.swift
//  Indicator
//
//  Created by 최영우 on 5/7/23.
//

import JGProgressHUD
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            self.showExample()
        })    }
    
    func showExample() {
        let hud = JGProgressHUD()
        hud.textLabel.text = "Loading"
        hud.detailTextLabel.text = "Please Wait"
        hud.show(in: view)
        
    }


}

