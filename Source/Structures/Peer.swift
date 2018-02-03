//
//  Peer.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class Peer {
    
    var name: Hash
    var lastModified: Date
    var neighbors: Array<Edge>
    var chain: Array<Block>?
    
    //class initalization
    init(_ name: String) {
        
        /*
         note: since native String types conforms to Hashable we can use this simple
         one way hash to encrypt the name of the peer in the public ledger.
        */
        
        self.name = name.hashValue
        
        lastModified = Date()
        neighbors = Array<Edge>()
    }
    
}
