//
//  ChecklistItem.swift
//  DoToList
//
//  Created by Paweł Liczmański on 15.12.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject, NSCoding {
    var name = ""
    var checked = true
    
    func toggleCheckmark() {
      checked = !checked
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    
    override init() {
        super.init()
    }
}
