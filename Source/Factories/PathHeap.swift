//
//  HeapSort.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/9/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class PathHeap {
    
    private var heap: Array<Path>

    
    //the number of frontier items
    var count: Int {
        return self.heap.count
    }
    
    
    init() {
        heap = Array<Path>()
    }
    
    
    
    //obtain the minimum path
    func peek() -> Path! {
        
        if (heap.count > 0) {
            var shortestPath: Path = heap[0]
            return shortestPath
        }
        else {
            return nil
        }
    }
    


    //remove the minimum path
    func deQueue() {
        
        if (heap.count > 0) {
            heap.removeAtIndex(0)
        }
        
    }
    

    //sort shortest paths into a min-heap (heapify)
    func enQueue(key: Path) {
        

        heap.append(key)
    
        
        var childIndex: Float = Float(heap.count) - 1
        var parentIndex: Int! = 0
        
        
        //calculate parent index
        if (childIndex != 0) {
            parentIndex = Int(floorf((childIndex - 1) / 2))
        }
        
        
        
        //use the bottom-up approach
        while (childIndex != 0) {
            
            
            var childToUse: Path = heap[Int(childIndex)]
            var parentToUse: Path = heap[parentIndex]
            
            
            //swap child and parent positions
            if (childToUse.total < parentToUse.total) {
                
                heap.insert(childToUse, atIndex: parentIndex)
                heap.removeAtIndex(Int(childIndex) + 1)
                
                
                heap.insert(parentToUse, atIndex: Int(childIndex))
                heap.removeAtIndex(parentIndex + 1)
                
            }
            
            
            //reset indices
            childIndex = Float(parentIndex)

        
            if (childIndex != 0) {
                parentIndex = Int(floorf((childIndex - 1) / 2))
            }
            
            
        } //end while
        
        
    } //end function

    
    
}