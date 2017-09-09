//
//  Heap.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/7/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation

/*
 note: a generic heap (e.g. priority queue) algorithm. This class functions
 as an min-heap but could also be modified to sort items as a max-heap
*/

class MinHeap<T: Comparable> {
    
    
    private var items: Array<T>
    
    
    init() {
        items = Array<T>()
    }
    
    
    //the number of frontier items
    var count: Int {
        return self.items.count
    }
    
    
    
    //obtain the minimum path
    func peek() -> T? {
        
        if items.count > 0 {
            return items[0] //the shortest path
        }
        else {
            return nil
        }
    }
    
    
    //sort items into a min-heap (heapify)
    func enQueue(_ key: T) {
        
        items.append(key)
        
        
        var childIndex: Float = Float(items.count) - 1
        var parentIndex: Int = 0
        
        
        //calculate parent index
        if (childIndex != 0) {
            parentIndex = Int(floorf((childIndex - 1) / 2))
        }
        
        
        var childToUse: T
        var parentToUse: T
        
        
        //use the bottom-up approach
        while childIndex != 0 {
            
            
            childToUse = items[Int(childIndex)]
            parentToUse = items[parentIndex]
            
            
            //swap child and parent positions
            if childToUse < parentToUse {
                items.swapAt(parentIndex, Int(childIndex))
            }
            
            
            //reset indices
            childIndex = Float(parentIndex)
            
            
            if (childIndex != 0) {
                parentIndex = Int(floorf((childIndex - 1) / 2))
            }
            
            
        } //end while
        
        
    } //end function
    
}
