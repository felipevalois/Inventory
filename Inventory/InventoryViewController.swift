//
//  InventoryViewController.swift
//  Inventory
//
//  Created by Felipe Costa on 7/18/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var inventoryTableView: UITableView!
    
    let jsonFileName = "inventory"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let inventory = InventorySetLoader.load(jsonFileName: jsonFileName){
            return inventory.productCount()
        }
        else{
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        
        if let cell = cell as? InventoryTableViewCell {
            if let inventory = InventorySetLoader.load(jsonFileName: jsonFileName){
                let product = inventory.products[indexPath.row]
                cell.titleLabel.text = "\(product.title)\n"
                cell.priceLabel.text = "$\(product.price)\n"
                cell.quantityLabel.text = "\(product.stockedQuantity) in stock\n\n"
            }
        }
        return cell
    }
    

}
