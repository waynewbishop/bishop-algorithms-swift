//
//  Peer.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation

public class Peer <T> {
    
    var name: T
    var lastModified: Date
    var isMiner: Bool
    var neighbors: Array<Edge>?
    
    
    init(name: T, isMiner: Bool = false) {
        
        self.name = name
        self.isMiner = isMiner
        lastModified = Date()
        neighbors = Array<Edge>()
    }
    
}
