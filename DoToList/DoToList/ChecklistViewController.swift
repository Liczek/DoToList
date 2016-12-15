//
//  ChecklistViewController.swift
//  DoToList
//
//  Created by Paweł Liczmański on 15.12.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

class ChecklistViewController: UITableViewController {
    
    var items: [ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        
        items = [ChecklistItem]()
        
        let item1 = ChecklistItem()
        item1.name = "Pierwszy"
        item1.checked = false
        items.append(item1)
        
        let item2 = ChecklistItem()
        item2.name = "Drugi"
        item2.checked = false
        items.append(item2)

        let item3 = ChecklistItem()
        item3.name = "Trzeci"
        item3.checked = false
        items.append(item3)
        
        super.init(coder: aDecoder)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistCell", for: indexPath)
        let item = items[indexPath.row]
        configureTextLabel(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
        let item = items[indexPath.row]
            item.toggleCheckmark()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func configureTextLabel(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = tableView.viewWithTag(1000) as! UILabel
        label.text = item.name
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item: ChecklistItem) {
        let label = tableView.viewWithTag(1001) as! UILabel
        
        if item.checked {
            
            label.text = "✓"
            label.textColor = .green
        } else {
            label.text = "✓"
            label.textColor = .lightGray
        }
    }
    
    
}

