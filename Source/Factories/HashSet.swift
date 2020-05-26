//
//  HashSet.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 5/18/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


class HashSet <T: Indexable> {
 
    private var buckets: Array<T?>
    private var slots: Int = 0
    
    
    init(capacity: Int = 20) {
        
        self.buckets = Array<T?>(repeatElement(nil, count: capacity))
        self.slots = buckets.capacity
    }
    

    func insert (_ element: T) -> Bool {
        
      //compute hash value
      let hvalue = self.hash(element)
        
        if buckets[hvalue] == nil {
            buckets[hvalue] = element
            slots -= 1

            
            //determine if more slots are needed
            if slots == 0 {
                buckets.append(nil)
                slots = 1
            }
            
            return true
        }
        
      return false
    }
    
        
    func contains(_ element: T) -> Bool {
        
      //compute hash value
      let hvalue = self.hash(element)
      
      guard buckets[hvalue] != nil else {
        return false
      }
                                
      return true
    }
    
    
    
    private func hash(_ element: T) -> Int {
        
        /*
         conforming indexable objects are required to have an
         ascii representation to be used by the hash algorithm. 
         */
        

        var remainder: Int = 0
        remainder = element.asciiRepresentation % buckets.count
        return remainder
    }
    
}
