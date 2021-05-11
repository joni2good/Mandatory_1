//
//  AddViewController.swift
//  Mandatory_1
//
//  Created by Jonathan Iversen on 07/04/2021.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var type: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addClicked(_ sender: Any) {
        let tempType:String = type.text!
        let tempPrice:Double = Double(price.text!)!
        let tempId:String = name.text!
        let tempItem = Item(type: tempType, price: tempPrice, ID: tempId)
        fs.addItem(item: tempItem)
        type.text = ""
        name.text = ""
        price.text = ""
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
