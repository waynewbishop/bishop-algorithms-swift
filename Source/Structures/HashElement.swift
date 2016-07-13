//
//  HashElement.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/13/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation

class HashElement<T> {
    
    var key: String
    var element: T?
    var next: HashElement<T>?
    
    init(withKey key: String) {
        self.key = key
    }
    
}
