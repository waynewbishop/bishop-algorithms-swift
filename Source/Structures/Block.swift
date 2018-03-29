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
    
    var key: Hash?
    var previous: Hash?
    var transactions: Array<Exchange>?
    var miner: Blockchain.Miner? //track the Miner instance who mined the transaction block..
    var lastModified: Date
    var description: String?
    
    
    //initialize class
    init() {
        self.lastModified = Date()
    }
    
}


