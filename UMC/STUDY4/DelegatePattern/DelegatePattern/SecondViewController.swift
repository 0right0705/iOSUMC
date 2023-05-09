//
//  FirstViewController.swift
//  DelegatePattern
//
//  Created by 최영우 on 5/7/23.
//

import Foundation
import UIKit

class SecondViewController: UIViewController, DeliveryDataProtocol {
    
    weak var delegate: DeliveryDataProtocol?
        
        override func viewDidLoad() {
            super.viewDidLoad()
        }
        
        @IBAction func preButtonAction(_ sender: Any) {
            delegate?.deliveryData("오늘 하루도 힘내세요!!")
            self.dismiss(animated: true, completion: nil)
        }
    

}
