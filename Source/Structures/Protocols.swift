//
//  Protocols.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/1/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation

/*
 note: to have this model working means the concept of the Miner as a contrete type goes away.
 this means all blockchain functions that were exlusive to peers can now be opened by implemented by miners.
 */

protocol Blockable {
        
    var blockchain: LinkedList<Block> {get}
    var description: String? {get}
    var balance: Float {get}
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


