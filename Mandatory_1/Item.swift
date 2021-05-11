//
//  item.swift
//  Mandatory_1
//
//  Created by Jonathan Iversen on 07/04/2021.
//

import Foundation

class Item {
    var type: String
    var price: Double
    var ID: String
    
    init(type: String, price: Double, ID: String){
        self.ID = ID
        self.type = type
        self.price = price
    }
}
