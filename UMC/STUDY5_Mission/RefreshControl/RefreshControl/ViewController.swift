//
//  ViewController.swift
//  RefreshControl
//
//  Created by 최영우 on 5/7/23.
//

import UIKit
class ViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var table: UITableView!
    
    struct Store {
        let title: String
        let imageName : String
    }
    
    let data: [Store] = [
        Store(title: "AppleStore", imageName: "ApplsStore"),
        Store(title: "BR31", imageName: "BR31")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Store = data[indexPath.row]
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        cell.label.text = Store.title
        //cell.iconImageView.image = UIImage(named: Store.imageName)
        return cell
    }
}

