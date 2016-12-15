//
//  ChecklistItem.swift
//  DoToList
//
//  Created by Paweł Liczmański on 15.12.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var name = ""
    var checked = true
    
    func toggleCheckmark() {
      checked = !checked
    }
}
