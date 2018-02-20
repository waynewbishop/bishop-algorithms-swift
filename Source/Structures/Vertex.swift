//
//  Vertex.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/7/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class Vertex: Keyable {
    
    var key = String()
    var neighbors = Array<Edge>()
    var visited: Bool = false
    var lastModified = Date()

    init() {
    }
    
    init(with name: String) {
       self.key = name
    }
    
    //hash table requirement
    var keystring: String {
        return self.key
    }
    
}
