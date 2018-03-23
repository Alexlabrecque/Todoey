//
//  Category.swift
//  Todoey
//
//  Created by Alexandre Labrecque on 18-03-20.
//  Copyright © 2018 Alexandre Labrecque. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    
    let items = List<Item>() //relationship with Item
}
