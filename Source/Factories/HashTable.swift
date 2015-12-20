//
//  HashTable.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


class HashTable {
    
    private var buckets: Array<HashNode?>
    
    
    //initialize the buckets with nil values
    init(capacity: Int) {
        self.buckets = Array<HashNode?>(count: capacity, repeatedValue:nil)
        
    }
    
    
    //add the key using the specified hash
    func addWord(firstname: String, lastname: String) {
        
        //create a hashvalue using the complete name
        let fullname = firstname + lastname
        let hashindex = self.createHash(fullname)
        
        
        let childToUse: HashNode = HashNode(firstname: firstname, lastname: lastname)
        
        
        //check for an existing list
        if let existingHead = buckets[hashindex] {
            
            //append existing chained list head to new item
            childToUse.next = existingHead
            
            //update the chained list
            buckets[hashindex] = childToUse
            
        } else {
            // No collision, just add the node at hashindex
            buckets[hashindex] = childToUse
        }
        
        
        
    } //end function
    
    
    
    //determine if the word is found in the hash table
    func findWord(firstname: String, lastname: String) -> Bool {
        
        let fullname = firstname + lastname
        let hashindex = self.createHash(fullname)
        
        
        //determine if the value is present
        if var node = buckets[hashindex] {
            
            while (node.firstname + node.lastname != fullname) {
                
                print("searching for word through chained list..")
                if let next = node.next {
                    node = next
                } else {
                    return false
                }
            } //end while
            
            print("\(node.firstname) \(node.lastname) found in hash table..")
            return true
        }
        
        
        print("name not found in hash table..")
        return false
        
    }
    
    
    
    //return the hash value to be used
    func createHash(fullname: String) -> Int {
        
        var remainder: Int = 0
        var divisor: Int = 0
        
        
        for key in fullname.unicodeScalars {
            //println("the ascii value of \(key) is \(key.value)..")
            divisor += Int(key.value)
        }
        
        /*
        note: modular math is used to calculate a hash value. The bucket count is used
        as the dividend to ensure all possible outcomes are between 0 and the collection size.
        This is an example of a simple but effective hash algorithm.
        */
        
        remainder = divisor % buckets.count
        
        
        return remainder - 1
    }
}