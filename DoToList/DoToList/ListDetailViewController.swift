//
//  ListDetailViewController.swift
//  DoToList
//
//  Created by Paweł Liczmański on 16.12.2016.
//  Copyright © 2016 Paweł Liczmański. All rights reserved.
//

import Foundation
import UIKit

protocol ListDetailViewControllerDelegate: class {
    func listDetailViewControllerCancel(_ controller: ListDetailViewController)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishAdding checklist: Checklist)
    func listDetailViewController(_ controller: ListDetailViewController, didFinishEditing checklist: Checklist)
}

class ListDetailViewController: UITableViewController, UITextFieldDelegate {
    
    weak var delegate: ListDetailViewControllerDelegate?
    var listToEdit: Checklist!
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        textField.placeholder = "Enter name of new list"
        textField.returnKeyType = .done
        textField.enablesReturnKeyAutomatically = true
        textField.autocapitalizationType = .sentences
        textField.becomeFirstResponder()
        
        doneBarButton.isEnabled = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let checklist = listToEdit {
            title = "Edit List"
            textField.text = checklist.name
        }else {
        title = "Add New List"
        }
    }
    
    @IBAction func done() {
        if let checklist = listToEdit {
            checklist.name = textField.text!
            delegate?.listDetailViewController(self, didFinishEditing: checklist)
        } else {
        let checklist = Checklist(name: textField.text!)
        delegate?.listDetailViewController(self, didFinishAdding: checklist)
        }
    }
    
    @IBAction func cancel() {
        delegate?.listDetailViewControllerCancel(self)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneBarButton.isEnabled = newText.length > 0
        return true
    }
    

    
    
}
