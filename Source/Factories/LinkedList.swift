//
//  SwiftFactory.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/7/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class LinkedList<T: Equatable> {
    
    
   //new instance
   private var head = LLNode<T>()
    
    
  
   var count: Int {
        
            if head.key == nil {
                return 0
            }
                
            else  {
                
                var current: LLNode = head
                var x: Int = 1
                
                
                //cycle through the list of items
                while current.next != nil {
                    current = current.next!
                    x += 1
                }
                
                return x
                
            }
    }
    
    
    
    //empty list check
    func isEmpty() -> Bool! {
        return self.count == 0 || head.key == nil
    }
    
    
    
    //add link item
    func append(element key: T) {

        
        //trivial check
        guard head.key != nil else {
            head.key = key
            return
        }
    
        
        var current: LLNode? = head
        
        
        while current != nil {
            
            if current?.next == nil {
                
                let childToUse = LLNode<T>()
                
                childToUse.key = key
                childToUse.previous = current
                current!.next = childToUse
                break
            }
                
            else {
                current = current?.next
            }
            
            
        } //end while
        
    }
    

    
    //print all keys for the class
    func printAllKeys() {
        
        var current: LLNode! = head
        
        print("------------------")
        
        //assign the next instance
        
        while current != nil {
            print("link item is: \(current.key)")
            current = current.next
        }
        
    }
    
    
    //MARK: Key & index operations
    
    
    //obtain link at a specific index
    func getElement(at index: Int) ->LLNode<T>! {

        
        //check empty conditions
        if ((index < 0) || (index > (self.count - 1)) || (head.key == nil)) {
            return nil
        }
        
            
        else  {
            var current: LLNode<T>! = head
            var x: Int = 0

            
            //cycle through elements
            while (index != x) {
                current = current.next
                x += 1
            }
            
            return current
            
        } //end else
        
        
    }

    
    
    
    //insert at specific index
    func insert(_ key: T, at index: Int) {
        
        
        //check for nil conditions
        if ((index < 0) || (index > (self.count - 1))) {
            print("link index does not exist..")
        }
        
        
        //establish the head node
        guard head.key != nil else {
            head.key = key
            return
        }
        
        
        //establish the trailer, current and new items
        var current: LLNode<T>? = head
        var trailer: LLNode<T>?
        var listIndex: Int = 0
        
        
        //iterate through the list to find the insertion point
        while (current != nil) {
            
            if (index == listIndex) {
                
                let childToUse: LLNode = LLNode<T>()
                
                //create the new node
                childToUse.key = key
                
                
                //connect the node infront of the current node
                childToUse.next = current
                childToUse.previous = trailer
                
                
                //use optional binding when using the trailer
                if let linktrailer = trailer {
                    linktrailer.next = childToUse
                    childToUse.previous = linktrailer
                }
                
                
                //point new node to the current / previous
                current!.previous = childToUse
                
                
                //replace the head node if required
                if (index == 0) {
                    head = childToUse
                }
                
                
                break
                
            } //end if
            
            
            //iterate through to the next item
            trailer = current
            current = current?.next
            listIndex += 1
            
            
        } //end while
        
    }

    
    
    
    //remove at specific index
    func remove(at index: Int) {
        
        //check for nil conditions
        if ((index < 0) || (index > (self.count - 1)) || (head.key == nil)) {
            print("link index does not exist..")
            return
        }
        

        var current: LLNode<T>? =  head
        var trailer: LLNode<T>?
        var listIndex: Int = 0
        
        
        //determine if the removal is at the head
        if (index == 0) {
            current = current?.next
            head = current!
            return
        }
        
        
        //iterate through the remaining items
        while current != nil {
            
            if listIndex == index {
                
                //redirect the trailer and next pointers
                trailer!.next = current?.next
                current = nil
                break
                
            }
            
            //update the assignments
            trailer = current
            current = current?.next
            listIndex += 1
            
        } //end while
        
        
    } //end function
    


    
    
  //reverse the order of a linked list
  func reverse() {
    
    //if count == 1 or count == 0,no need to reverse
    if self.count <= 1{
      return
    }

    
    var current : LLNode<T>? = head
    var next : LLNode<T>? = nil
    
    
    while(current != nil) {
        
      //reverse
      next = current!.next
      current!.next = current!.previous
      current!.previous = next
      
      
      if next == nil {
        head = current!
      }
      
      //move to next node
      current = next
        
    }
    
  }
    
  
    
    
    //MARK: Closure operations
    

    
    /*
    notes: These "generic methods" mimic the map & filter array
    functions found in the Swift standard library.
    */
    
    
    //filter list content - higher order function
    func filter(_ formula: (LLNode<T>) -> Bool) -> LinkedList<T>! {
        
        
        //check for instance
        guard head.key != nil else {
            return nil
        }
        
        
        var current: LLNode! = head
        let results: LinkedList<T>! = LinkedList<T>()
        
        
        while current != nil {
            
            //filter based on formula
            if formula(current) == true {
                results.append(element: current.key)
            }
            
            
            current = current.next
        }
        
        
        return results
        
    }
    
    
    
    //map list content - higher order function
    func map(_ formula: (LLNode<T>) -> T) -> LinkedList<T>! {
        
        
        //check for instance
        guard head.key != nil else {
            return nil
        }
        
        
        var current: LLNode! = head
        let results: LinkedList<T>! = LinkedList<T>()
        var newKey: T!
        
        
        while current != nil {
            
            //map based on formula
            newKey = formula(current)
            
            //add non-nil entries
            if newKey != nil {
                results.append(element: newKey)
            }
            
            
            current = current.next
        }
        
        
        return results
        
    }

    
    
    
} //end class






