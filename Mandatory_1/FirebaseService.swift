//
//  FirebaseService.swift
//  Mandatory_1
//
//  Created by Jonathan Iversen on 07/04/2021.
//

import Foundation
import Firebase

class FirebaseService {
    private var db = Firestore.firestore()
    var itemsCol = "items"
    var ordersCol = "orders"
    var items = [Item]()
    var orders = [Order]()
    var parent:Updateable?
    
    func addItem(item: Item){
        let doc = db.collection(itemsCol).document(item.ID)
        var data = [String:Any]()
        data["type"] = item.type
        data["price"] = item.price
        doc.setData(data)
        
    }
    
    func addOrder(priceToAdd: Double) {
        let price = priceToAdd
        print("Data: \(price)")
            let doc = db.collection(ordersCol).document()
            var data = [String:Double]()
            data["price"] = price
            doc.setData(data)
    }
    
    func delItem(index: Int){
        let itemToDel = self.items[index]
        db.collection(itemsCol).document(itemToDel.ID).delete()
        items.remove(at: index)
    }
    
    func startListener() {
        db.collection(itemsCol).addSnapshotListener { (snap, error) in
            if let e = error {
                print("error fetching data \(e)")
            }else{
                if let s = snap{
                    self.items.removeAll()
                    for doc in s.documents {
                        if let type = doc.data()["type"] as? String{
                            if let price = doc.data()["price"] as? Double{
                                let item = Item(type: type, price: price, ID:doc.documentID)
                                self.items.append(item)
                            }
                        }
                    }
                    self.parent?.update()
                }
            }
        }
    }
    
    func getOrders(){
        db.collection(ordersCol).addSnapshotListener { (snap, error) in
            if let e = error{
                print("error fetching data \(e)")
            }else{
                if let s = snap{
                    self.orders.removeAll()
                    for doc in s.documents {
                        if let price = doc.data()["price"] as? Double{
                            let order = Order(price: price, ID:doc.documentID)
                            self.orders.append(order)
                        }
                    }
                    print(self.orders)
                }
            }
        }
    }
}

