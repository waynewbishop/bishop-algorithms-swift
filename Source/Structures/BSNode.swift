//
//  BSNode.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/16/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


//generic node to be used with binary search trees (BST's)

class BSNode<T>{
    
    var key: T?
    var left: BSNode?
    var right: BSNode?
    var height: Int
    
    init() {
        self.height = -1
    }
    
}
