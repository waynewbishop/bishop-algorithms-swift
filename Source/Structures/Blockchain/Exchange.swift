//
//  Exchange.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 2/2/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Exchange {
    
    var from: Member?
    var to: Member
    var amount: Float
    var desc: String?
    var miner: Miner?
    var lastModified: Date

    
    //class initialization
    init(_ from: Member? = nil , _ to: Member, _ amount: Float, _ desc: String?) {
        
        self.from = from
        self.to = to
        self.amount = amount
        self.desc = desc
        self.lastModified = Date()
    }
    
}
