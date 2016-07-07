//
//  HashList.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/5/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


//a "generic" hash table


class HashList<T> {
    
    
    var buckets: Array<Node<T>?>

    
    init(capacity: Int) {
        self.buckets = Array<Node<T>?>(repeatElement(nil, count: capacity))
    }
    
    
    //add item to the list
    func append(_ element: T) -> HashResults {
        
        
         /*
         note: The append process supports multiple types and can be extended.
         see list.swift for details.
         */

        
        let hashResults = self.createHash(withElement: element)

        
        //test results
        guard hashResults.1 == HashResults.Success else {
            return hashResults.1
        }
        
        
        //new nodes
        let childToUse = Node<T>()
        var head: Node<T>!

        
        let hashIndex = hashResults.0
        childToUse.key = element
        
        
        //check for an existing list
        if  buckets[hashIndex] == nil {
            buckets[hashIndex] = childToUse
        }

        else {
            
            print("a collision occured. implementing chaining..")
            head = buckets[hashIndex]
            
            
            //append new item to the head of the list
            childToUse.next = head
            head = childToUse
            
            
            //update the chained list
            buckets[hashIndex] = head
        }
        
        
        return HashResults.Success
        
    }

    
    
    func getElement(withKey key: T) -> T! {
        
        //TODO: hash the key, then retreive the object at that index - will also support chained lists..
        
        return nil
    }
    
    
}
