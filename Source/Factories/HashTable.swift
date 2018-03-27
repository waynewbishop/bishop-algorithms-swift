//
//  HashTable.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/5/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


/*
 note: a generic hash table. types supported must conform to the
 custom Keyable protocol.
*/


class HashTable<T: Keyable> {
    
   private var buckets: Array<Node<T>?>
    
    /*
     note: initializing the hash table with an initial capacity shown
     for educational purposes only. 
    */
    init(capacity: Int) {
        self.buckets = Array<Node<T>?>(repeatElement(nil, count: capacity))
    }
    
    
    //TODO: create a computed property - hashvalue that calculates the key for a specific index.
    
    
    
    //add item to list
    func insert(_ element: T) -> Result {
        
        let result: Result

        
        //compute hash
        let hashIndex = element.hashValue(for: element.keystring, using: buckets)
        
        
        if hashIndex != -1 {
            
            let childToUse = Node<T>()
            childToUse.key = element
            
            
            //check existing list
            if  buckets[hashIndex] == nil {
                buckets[hashIndex] = childToUse
                result = Result.Success
            }
                
            else {
                
                print("collision occurred. implementing chaining..")
                
                var head = buckets[hashIndex] as Node<T>?
                
                //append item
                childToUse.next = head
                head = childToUse

                
                //update chained list
                buckets[hashIndex] = head
                
                result = Result.Collision
            }
        }
            
        else {
            result = Result.Fail
        }
        
        return result
    }
    

    
    //test for containing element 
    func contains<T: Keyable>(_ element: T) -> Bool  {

        
        //obtain hash index
        let hashIndex = element.hashValue(for: element.keystring, using: buckets)
    
        
        guard hashIndex != -1 else {
            return false
        }
        
        
        if buckets[hashIndex] != nil {
            
            var current = buckets[hashIndex]
            
            //check chained list for match
            while current != nil {
               
                /*
                 note: test for equality. since the user provided input as well as
                 the hash table contents both conform to the Keyable protocol, table
                 elements can be interpreted as a Keyable "type". This centralized
                 conformance allows seemingly different objects to
                 be compared equally (e.g. String vs Vertex).
                */
                
                if let item: Keyable = current?.key {
                    if item.keystring == element.keystring {
                        return true
                    }
                }
                current = current?.next
                
             } //end while
        }
        
        return false
    }
    
}
