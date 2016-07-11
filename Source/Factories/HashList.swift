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

        
        let hashResults = self.hashElement(element)

        
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
            
            
            //append item to head of list
            childToUse.next = head
            head = childToUse
            
            
            //update the chained list
            buckets[hashIndex] = head
        }
        
        
        return HashResults.Success
        
    }

    
    //retrieve a list element
    func getElement(_ key: String) -> (T?, HashResults) {
        
        
        let hashIndex = self.hashString(key)
        

        //test hash results
        if hashIndex == 0 || buckets[hashIndex] == nil {
            return (nil, HashResults.NotFound)
        }
        

       // var current: Node! = buckets[hashIndex]
        
        
        
        /*
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

         
        */
        
        
        return (nil, HashResults.Fail)
    }
    
    
}
