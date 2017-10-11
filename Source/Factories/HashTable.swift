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
    
    
    init(capacity: Int) {
        self.buckets = Array<Node<T>?>(repeatElement(nil, count: capacity))
    }
    
    
    //add item to list
    func append(_ element: T) -> Results {
        
        let results: Results

        
        //compute hash
        let hashIndex = element.hashkey(for: element.keyitem, using: buckets)
        
        
        if hashIndex != -1 {
            
            let childToUse = Node<T>()
            childToUse.key = element
            
            
            //check existing list
            if  buckets[hashIndex] == nil {
                buckets[hashIndex] = childToUse
                results = Results.Success
            }
                
            else {
                
                print("collision occurred. implementing chaining..")
                
                var head = buckets[hashIndex] as Node<T>?
                
                //append item
                childToUse.next = head
                head = childToUse

                
                //update chained list
                buckets[hashIndex] = head
                
                results = Results.Collision
            }
        }
            
        else {
            results = Results.Fail
        }
        
        
        return results
    }
    

    
    //test for containing element - O(1)
    func contains<T: Keyable>(_ element: T) -> Bool  {

        
        //obtain hash index
        let hashIndex = element.hashkey(for: element.keyitem, using: buckets)
        
        
        guard hashIndex != -1 else {
            return false
        }
        
        
        if buckets[hashIndex] != nil {
            
            var current = buckets[hashIndex]
            
            
            //check chained list for match
            while current != nil {
               
                /*
                guard let key = current?.key as? String else {
                    return false
                }
                */
                
                
                //TODO: Holy smokes this works!! - just safely unwrap and this is done..
                let item: Keyable = current!.key!
                
                
                //determine match
                if item.keyitem == element.keyitem {
                    return true
                }
                
                current = current?.next
             }
        }
                
        return false
    }
    
}
