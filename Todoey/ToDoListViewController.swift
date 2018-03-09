//
//  ViewController.swift
//  Todoey
//
//  Created by Alexandre Labrecque on 18-03-07.
//  Copyright © 2018 Alexandre Labrecque. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = ["Find Mike", "Buy Eggos", "Demogorgon"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let items = defaults.array(forKey: "todoListArray") as? [String] {
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
        
        cell.textLabel?.text = itemArray[indexPath.row] //Attribute the item at position #indexpath, so which item is going to be the text
        
        return cell // Display the cell
    }
    
    //MARK - TableView Delegate Methods
        // Method fired everytime we click on any cell in the table view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
 
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField() // local variable
        
            // Pop up alert to add new item
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // What will happen once the user clicks the add item button on the UIAert
            
            self.itemArray.append(textField.text!) // add to itemArray the new item
            
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

