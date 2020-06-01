//
//  Protocols.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/1/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//used by peers and miners - blockchain requirement
protocol Blockable {
    
    var description: String? {get}
    var chain: LinkedList<Block> {get}
}



//define computed property - hashSet requirement
protocol Indexable {
    var asciiRepresentation: Int {get}
}



//determine sort order
protocol Sortable {
    func isSorted<T: Comparable>(_ sequence: Array<T>) -> Bool
}


