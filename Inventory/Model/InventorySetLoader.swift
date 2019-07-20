//
//  InventorySetLoader.swift
//  Inventory
//
//  Created by Felipe Costa on 7/18/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import Foundation

class InventorySetLoader {
    
    class func load(jsonFileName: String) -> InventorySet? {
        var inventorySet: InventorySet?
        let jsonDecoder = JSONDecoder()
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl){
            inventorySet = try? jsonDecoder.decode(InventorySet.self, from: jsonData)
        }

        return inventorySet
    }
}
