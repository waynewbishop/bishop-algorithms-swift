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
        
        if let hashKey = self.getHashKey(withElement: element) {
            
            
            let hashIndex = self.hashString(hashKey)
            
            
            //new nodes
            let childToUse = Node<T>()
            var head: Node<T>!
            
            
            childToUse.key = element
            
            
            //check for an existing list
            if  buckets[hashIndex] == nil {
                buckets[hashIndex] = childToUse
            }
                
            else {
                
                print("a collision occured. implementing chaining..")
                head = buckets[hashIndex]
                
                
                //append item to head of list
                childToUse.next = head
                head = childToUse
                
                
                //update the chained list
                buckets[hashIndex] = head
            }

            
        } //end if
            
        
        else {
            return HashResults.NoType
        }
        
        
        return HashResults.Fail
        
    }

    
    //retrieve a list element
    func getElement(withKey key: String) -> (T?, HashResults) {
        
        
        let hashIndex = self.hashString(key)
        

        //test results
        if hashIndex == 0 || buckets[hashIndex] == nil {
            return (nil, HashResults.NotFound)
        }
        

        let current: Node<T>! = buckets[hashIndex]
        
        
        //check chained list
        while (current != nil) {
        
            //check for a string match based on the type of object..
            
            //let hashKey = self.getHashKey(withElement: current)
                    
        }
        
        
        
        
        return (nil, HashResults.Fail)
    }
    
    
}
