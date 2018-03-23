//
//  Item.swift
//  Todoey
//
//  Created by Alexandre Labrecque on 18-03-20.
//  Copyright © 2018 Alexandre Labrecque. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated: Date?
    
    var parentCategry = LinkingObjects(fromType: Category.self, property: "items") //Inverse Relashionship with Category
}
