//
//  Exchange.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 2/2/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Exchange {
    
    var to: Peer
    var from: Peer
    var amount: Double
    var miner: Miner?
    var lastModified: Date

    
    //class initialization
    init(_ from: Peer, _ to: Peer, _ amount: Double) {
        
        self.from = from
        self.to = to
        self.amount = amount
        self.lastModified = Date()
    }
    
}
