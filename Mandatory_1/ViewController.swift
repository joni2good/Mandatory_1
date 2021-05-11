//
//  ViewController.swift
//  Mandatory_1
//
//  Created by Jonathan Iversen on 07/04/2021.
//

import UIKit
import Firebase

let fs = FirebaseService()
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, Updateable {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var total: UILabel!
    
    private var db = Firestore.firestore()
    
    var tempIndex: Int? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fs.parent = self
        fs.startListener()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func payOrder(_ sender: Any) {
        let temp = Double(total.text ?? "0")!
        fs.addOrder(priceToAdd: temp)
        total.text = "0.0"
    }
    
    func update() {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fs.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        cell.textLabel?.text = String(fs.items[indexPath.row].ID)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let temp = Double(total.text ?? "0")!
        total.text! = String(fs.items[indexPath.row].price + temp)
        self.tempIndex = indexPath.row
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        fs.delItem(index: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
}

