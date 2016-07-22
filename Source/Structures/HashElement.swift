//
//  HashElement.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/13/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//a generic element use with HashLists

class HashElement<T> {
    
    var element: T?
    var next: HashElement<T>?
}
