//
//  Block.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


typealias Hash = Int

public class Block {
    
    /*
     note: all optional values are initiated by the network (e.g. Graph)
     and fulfilled by a Miner at runtime.
    */
    
    var id: Hash?
    var previous: Hash?
    var from: Peer?
    var to: Peer?
    var amount: Double?
    var miner: Blockchain.Miner? //track the Miner who mined the transaction block..
    var isPending: Bool
    var lastModified: Date
    
    
    //initialize class
    init() {
        self.isPending = true
        self.lastModified = Date()
    }
    
}


