//
//  OrderViewController.swift
//  Mandatory_1
//
//  Created by Jonathan Iversen on 07/04/2021.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var orderTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fs.getOrders()
        orderTable.delegate = self
        orderTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fs.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ordersOrders", for: indexPath)
        cell.textLabel?.text = String("Price: \(fs.orders[indexPath.row].price)")
        return cell
    }
}
