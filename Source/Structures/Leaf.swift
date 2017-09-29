//
//  Leaf.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/27/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation

//note: a decision tree node

class Leaf <T: Equatable>{
    
    var results: Array<Outcome<T>>
    var left: Leaf?
    var right: Leaf?
    var question: String?
    
    /*
     note: when querying my training data set I can create my own querying syntax and filtering mechanisim using closures.
     refer to my previous work with linkedlist.filter for details. 
     
     let array = arrayDirectory.filter {
     guard let name = $0["DisplayName"] as? String else {
     return false
     }
     return name.contains(searchText)
     }
     
    */
    
    var height: Int = 0
    
    init() {
        self.results = Array<Outcome<T>>()
    }    
}
