//
//  ViewController.swift
//  Todoey
//
//  Created by Alexandre Labrecque on 18-03-07.
//  Copyright © 2018 Alexandre Labrecque. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if let items = defaults.array(forKey: "todoListArray") as? [String] {
//            itemArray = items
//        }
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggo"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Demogorgon"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }

    }
    
    //MARK - TableView DataSource Methods
    
        // Tells how many rows we need
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
        //Tells which item goes where
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) //tells which cell
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title //Attribute the item at position #indexpath, so which item is going to be the text
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none

        
        return cell // Display the cell
    }
    
    //MARK - TableView Delegate Methods
        // Method fired everytime we click on any cell in the table view
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
 
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField() // local variable
        
            // Pop up alert to add new item
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user clicks the add item button on the UIAert
            
                // add to itemArray the new item
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            // save updated array to user defaults
            self.defaults.set(self.itemArray, forKey: "todoListArray")
            
            self.tableView.reloadData() // Reload tablView
        }
        
            // Create the text field to add text, activated when user opens the alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

