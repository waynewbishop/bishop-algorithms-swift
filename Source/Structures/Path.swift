//
//  File.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/4/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation

//the path class maintains objects that comprise the "frontier"

class Path {
    
    var total: Int
    var destination: Vertex
    var previous: Path?

    
    //object initialization
    init(){
        destination = Vertex()
        total = 0
    }
    
}
