//
//  Block.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


typealias Hash = String

public class Block {
    
    /*
     note: all optional values are initiated by the network (e.g. Graph)
     and fulfilled by a Miner at runtime.
    */
    
    //TODO: This model needs to be refined so that is resembles a doubly linked list data structure.
    
    
    var id: String?
    var previous: String?
    var transactions: Array<Exchange>?
    
    //track the entity that mined the block..
    var miner: Blockchain.Miner?
    var lastModified: Date
    var description: String?
    
    
    //initialize class
    init() {
        self.lastModified = Date()
    }
    
}


