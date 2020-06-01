//
//  Block.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class Block {
    
    /*
     note: all optional values are initiated by the network (e.g. Graph)
     and fulfilled by a Miner at runtime.
    */
        
    
    var hash: String?
    var transactions: Array<Exchange>?
    
    var miner: Miner?
    var lastModified: Date
    var description: String?
    
    
    //initialize class
    init() {
        self.lastModified = Date()
    }
    
}


