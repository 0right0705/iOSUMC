//
//  UIRefreshControl.swift
//  RefreshControl
//
//  Created by 최영우 on 5/7/23.
//

import Foundation
import UIKit


class RefreshViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        self.empList = self.empDAO.find()
        self.initUI()
    }
    
    }
