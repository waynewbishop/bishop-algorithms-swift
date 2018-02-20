//
//  Exchange.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 2/2/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Exchange {
    
    var to: Hash
    var from: Hash
    var amount: Double
    var lastModified: Date

    //class initialization
    init(_ from: Hash, _ to: Hash, _ amount: Double) {
        
        self.from = from
        self.to = to
        self.amount = amount
        self.lastModified = Date()
    }
    
}
