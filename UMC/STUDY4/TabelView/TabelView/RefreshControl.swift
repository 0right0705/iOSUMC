//
//  RefreshControl.swift
//  TabelView
//
//  Created by 최영우 on 5/7/23.
//

import Foundation
import UIKit

class UIRefreshControl: UIControl {
    func initRefresh() {
        let refresh: UIRefreshControl = UIRefreshControl()
        refresh.addTarget(self, action: #selector(refreshing(refresh:)), for: .valueChanged)
        self.tableView.refreshControl = refresh
    }

    @objc func refreshing(refresh: UIRefreshControl) {
        refresh.endRefreshing() // refresh 작업이 끝났음을 알린다.
        self.tableView.reloadData()
    }
    
}
