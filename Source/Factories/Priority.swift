//
//  Priority.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 5/25/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation

/*
 note: organize a list of repeating elements based on occurence.
 based on the concept of the max-heap. the custom "table" could be
 replaced with a standard dictionary collection.
*/


class Priority <T: Comparable> {
    
    
    private var items: Array<Table<T>> = [Table<T>]()
        
    
    //return the entire structure
    func peek() -> Array<Table<T>>? {
        
        if items.count > 0 {
            return items
        }
        else {
            return nil
        }
    }

    
    
    func add(_ tvalue: T) {
        
        var isAdded: Bool = false
        
        var parentIndex: Int = 0
        var addedIndex: Float = -1
        var childIndex: Float = 0
        
        
        //dp - check for existing values
        
        for s in items {
            addedIndex += 1
        
            if s.tvalue == tvalue {
                s.count += 1
                isAdded = true
                childIndex = addedIndex
            }
        }
        
        
        if isAdded == false {
            let table: Table = Table(tvalue)
            items.append(table)
            
            //update index
            childIndex = Float(items.count) - 1
        }
                
        
        //heapify - bottom-up approach
                  
          
          //calculate parent index
          if  childIndex != 0 {
              parentIndex = Int(floorf((childIndex - 1) / 2))
          }
          
          
          var childToUse: Table<T>
          var parentToUse: Table<T>
          
              
          //use the bottom-up approach
          while childIndex != 0 {
              
              
              childToUse = items[Int(childIndex)]
              parentToUse = items[parentIndex]
              
                  
              //swap child and parent positions
              if childToUse.count > parentToUse.count {
                  items.swapAt(parentIndex, Int(childIndex))
              }
              
              
              //reset indices
              childIndex = Float(parentIndex)
              
              
              if childIndex != 0 {
                  parentIndex = Int(floorf((childIndex - 1) / 2))
              }
              
              
          } //end while
        
        
    } //end function
         
        
}
