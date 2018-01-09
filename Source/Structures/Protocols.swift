//
//  Protocols.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/1/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//determine sort order
protocol Sortable {
    
    func isSorted<T: Comparable>(_ sequence: Array<T>) -> Bool
}


//determine hash table compliance - (used a type and constraint)
protocol Keyable {
    
    //conforming types require property
    var keystring: String {get}
    
    
   func hashValue<T>(for key: String!, using buckets: Array<T>) -> Int
}

