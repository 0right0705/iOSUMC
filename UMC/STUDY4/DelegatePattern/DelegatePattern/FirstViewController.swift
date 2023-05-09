//
//  DeliveryDataProtocol.swift
//  DelegatePattern
//
//  Created by 최영우 on 5/7/23.
//

import Foundation
import UIKit

class FirstViewController: UIViewController, DeliveryDataProtocol {

    
    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataLabel.isHidden = true
    }
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        vc.delegate = self // 대리자 설정
        self.present(vc, animated: true, completion: nil)
    }

    
    func deliveryData(_ data: String) {
        dataLabel.isHidden = false
        dataLabel.text = data
    }
}

protocol DeliveryDataProtocol: class {
    func deliveryData(_ data: String)
}
