//
//  Node.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/2/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//generic node for stacks, queues and hashlists


class Node<T> {
    
    var key: T!
    var next: Node!
}

