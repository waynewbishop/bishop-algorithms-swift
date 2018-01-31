//
//  Block.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


typealias Hash = Int

public class Block <T> {
    
    var previous: Hash
    var from: Peer<T>
    var to: Peer<T>
    var amount: Double?
    var isPending: Bool
    var lastModified: Date
    

    //block initialization
    init(from: Peer<T>, to: Peer<T>, previous: Hash, amount: Double, isPending: Bool = true) {
    
        self.previous = previous
        self.from = from
        self.to = to
        self.amount = amount
        self.isPending = isPending
        self.lastModified = Date()
    }
}
