//
//  AddItemViewController.swift
//  DoToList
//
//  Created by Paweł Liczmański on 15.12.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerCancel(_ controller: AddItemViewController)
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem)
    func addItemViewController(_ controller: AddItemViewController, didFinishAddingFew item: ChecklistItem)
    func addItemViewController(_ controller: AddItemViewController, didFinishEditing item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    weak var delegate: AddItemViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
        title = "Edit Item"
        textField.returnKeyType = .done
        textField.text! = item.name
        } else {
        textField.returnKeyType = .continue
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doneBarButton.isEnabled = false        
        textField.becomeFirstResponder()
        textField.placeholder = "Enter new item name here"
        textField.enablesReturnKeyAutomatically = true
        textField.autocapitalizationType = .sentences
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
// ??????????? jak zrobić że nowy text musi być inny niż stary?
        doneBarButton.isEnabled = (newText.length > 0  && newText != oldText)
        
        return true
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func done() {
        if let item = itemToEdit {
            item.name = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: item)
        } else {
        let item = ChecklistItem()
            item.name = textField.text!
            delegate?.addItemViewController(self, didFinishAdding: item)
        }
    }
    
    @IBAction func doneFew() {
        if let item = itemToEdit {
            item.name = textField.text!
            delegate?.addItemViewController(self, didFinishEditing: item)
        } else {
        let item = ChecklistItem()
        item.name = textField.text!
        delegate?.addItemViewController(self, didFinishAddingFew: item)
        textField.text = ""
        doneBarButton.isEnabled = false
        textField.becomeFirstResponder()
        }
    }
    
    
    @IBAction func cancel() {
        delegate?.addItemViewControllerCancel(self)
        
    }
    
    
    
    
}
