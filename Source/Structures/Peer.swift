//
//  Peer.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation

/*
 note: since native String types conforms to Hashable we can use this simple
 one way hash to encrypt the name of the peer in the public ledger.
 */


public class Peer : Vertex {
    
    var lastModified: Date
    var chain: Array<Block>?
    
    
    init(withname name: String) {
        
        lastModified = Date()
        super.init()
        super.key = String(name.hashValue)
    }
    
}
