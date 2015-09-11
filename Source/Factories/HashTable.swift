//
//  HashTable.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


class HashTable {
    
    private var buckets: Array<HashNode!>
    
    
    //initialize the buckets with nil values
    init(capacity: Int) {
        self.buckets = Array<HashNode!>(count: capacity, repeatedValue:nil)
        
    }

    
    //add the key using the specified hash
    func addWord(firstname: String, lastname: String) {
        
        var hashindex: Int!
        var fullname: String!
        
        
        //create a hashvalue using the complete name
        fullname = firstname + lastname
        hashindex = self.createHash(fullname)
        
        
        let childToUse: HashNode = HashNode()
        var head: HashNode!
        
        
        childToUse.firstname = firstname
        childToUse.lastname = lastname
        
        
        //check for an existing list
        if  buckets[hashindex] == nil {
            buckets[hashindex] = childToUse
        }
        
        else {
            
            print("a collision occured. implementing chaining..")
            head = buckets[hashindex]
            
            
            //append new item to the head of the list
            childToUse.next = head
            head = childToUse
            
            
            //update the chained list
            buckets[hashindex] = head
        }

        
    } //end function
    
    
    
    //determine if the word is found in the hash table
    func findWord(firstname: String, lastname: String) -> Bool! {
        
        var hashindex: Int!
        var fullname: String!
        
        
        fullname = firstname + lastname
        hashindex = self.createHash(fullname)
        
        
        //determine if the value is present
        if  buckets[hashindex] == nil {
            print("name not found in hash table..")
            return false
        }
        
            
        //iterate through the list of items to find a match
        else {
            
            var current: HashNode! = buckets[hashindex]
            
            while (current != nil) {
                
                let hashName: String! = current.firstname + current.lastname
                
                if (hashName == fullname) {
                    print("\(current.firstname) \(current.lastname) found in hash table..")
                    return true
                }
                
                
                print("searching for word through chained list..")
                current = current.next
                
                
             } //end while
            
            
        } //end if
        
        
        print("name not found in hash table..")
        return false
        
    }
    
    
    
   //return the hash value to be used
   func createHash(fullname: String) -> Int! {
        
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