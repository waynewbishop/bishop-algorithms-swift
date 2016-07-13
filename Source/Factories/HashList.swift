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
    
    
    var buckets: Array<HashElement<T>?>

    
    init(capacity: Int) {
        self.buckets = Array<HashElement<T>?>(repeatElement(nil, count: capacity))
    }
    
    
    //add element to list
    func append(_ element: T, withKey key: String) -> HashResults {
        
        
        let results: HashResults
        
        
        //determine hash
        let hashIndex = self.createHash(key)
        
        
        //placeholder elements
        let childToUse = HashElement<T>(withKey: key)
        var head: HashElement<T>?
        
        
        childToUse.element = element
        
        
        //check existing list
        if  buckets[hashIndex] == nil {
            buckets[hashIndex] = childToUse
            
            results = HashResults.Success
        }
            
        else {
            
            print("a collision occured. implementing chaining..")
            head = buckets[hashIndex]
            
            
            //append item to head of list
            childToUse.next = head
            head = childToUse
            
            
            //update chained list
            buckets[hashIndex] = head
            
            
            results = HashResults.Collision
        }
        
        
        return results
        
    }
    

    
    //retrieve list element
    func getElement(withKey key: String) -> (HashElement<T>?, HashResults) {
        
        
        let hashIndex = self.createHash(key)
        
        
        //trivial check
        guard buckets[hashIndex] != nil else {
            return (nil, HashResults.NotFound)
        }

        
        var current: HashElement<T>? = buckets[hashIndex]
        
        
        //check chained list for key
        while (current != nil) {
            
            if current?.key == key {
                print("element found..")
                
                return (current, HashResults.Success)
            }
            
            
            print("searching through chained list..")
            current = current?.next
            
        }
        
        
        return (nil, HashResults.Fail)
        
    }
    
    
    
    //MARK: Helper Function

    
    
    //hash based on string
    func createHash(_ key: String) -> Int {
        
        var remainder: Int = 0
        var divisor: Int = 0
        
        for key in key.unicodeScalars {
            divisor += Int(key.value)
        }
        
        
        /*
         note: modular math is used to calculate a hash value. The bucket count is used
         as the dividend to ensure all possible outcomes are between 0 and the collection size.
         */
        
        remainder = divisor % buckets.count
        
        return remainder - 1
    }
    
    
}
