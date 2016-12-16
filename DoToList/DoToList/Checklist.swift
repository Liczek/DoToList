//
//  Checklist.swift
//  DoToList
//
//  Created by Paweł Liczmański on 16.12.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import Foundation


class Checklist: NSObject {
    
    var name = ""
    init(name: String) {
        self.name = name
        super.init()
    }
}

