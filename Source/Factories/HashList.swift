//
//  HashList.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/5/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//a generic hash table

class HashList<T: Comparable> {
    
    
    var buckets: Array<Node<T>?>

    
    init(capacity: Int) {
        self.buckets = Array<Node<T>?>(repeatElement(nil, count: capacity))
    }
    
    
    
    func append(_ element: T) -> Bool {
        
        //establish hash
        let hashIndex = self.createHash(withElement: element)

        
        //trivial condition
        guard hashIndex != 0 else {
            return false
        }
        

        return true
    }
    
    
}
