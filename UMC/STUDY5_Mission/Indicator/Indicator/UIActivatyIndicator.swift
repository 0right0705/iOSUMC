//
//  UIActivatyIndicator.swift
//  Indicator
//
//  Created by 최영우 on 5/7/23.
//

import Foundation
import UIKit

class IndicatorViewController: UIViewController {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
            // 해당 클로저에서 나중에 indicator 를 반환해주기 위해 상수형태로 선언
            let activityIndicator = UIActivityIndicatorView()
            
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            
            activityIndicator.center = self.view.center
            
            // 기타 옵션
            activityIndicator.color = .purple
            activityIndicator.hidesWhenStopped = true
            activityIndicator.style = .medium
            
            // stopAnimating을 걸어주는 이유는, 최초에 해당 indicator가 선언되었을 때, 멈춘 상태로 있기 위해서
            activityIndicator.stopAnimating()
            
            return activityIndicator
            
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(activityIndicator)
    }
    
 
    @IBAction func startButtonClicked(_ sender: Any) {
        activityIndicator.startAnimating()
    }
    
    
    @IBAction func stopButtonClicked(_ sender: Any) {
        activityIndicator.stopAnimating()
    }
}
