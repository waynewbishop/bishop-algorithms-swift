//
//  Protocols.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/1/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//peers and miners share blockchain membership
protocol Member {
        
    var blockchain: LinkedList<Block> {get}
    var desc: String? {get}
    var bal: Float {get}
}



//define computed property - hashSet requirement
protocol Indexable {
    var asciiRepresentation: Int {get}
}



//determine sort order
protocol Sortable {
    func isSorted<T: Comparable>(_ sequence: Array<T>) -> Bool
}


