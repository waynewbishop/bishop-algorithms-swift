//
//  LinkedList.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/7/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class LinkedList<T: Equatable> {
    
    
   private var head: LLNode<T>?
    
    
  
   var count: Int {
        
        guard let head = head else { return 0 }
    
        var current = head
        var x = 1
        
        
        //cycle through the list of items
        while current.next != nil {
            current = current.next!
            x += 1
        }
        
        return x
    
    }
    
    
    
    //empty list check
    var isEmpty: Bool {
        return count == 0
    }
    
    
    
    //add link item
    func append(element key: T) {
        insert(key, at: count)
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
    func getElement(at index: Int) -> LLNode<T>? {

        
        //check empty conditions
        guard index >= 0 && index < count else {
            return nil
        }
        
        
        var current: LLNode<T>! = head
        var x = 0

        
        //cycle through elements
        while index != x {
            current = current.next
            x += 1
        }
        
        return current
        
        
    }

    
    
    
    //insert at specific index
    func insert(_ key: T, at index: Int) {
        
        
        //check for nil conditions
        guard index >= 0 && index <= count else {
            print("link index does not exist..")
            return
        }
        
        
        //establish the head node
        guard let head = head else {
            self.head = LLNode<T>()
            self.head?.key = key
            return
        }
        
        
        var current: LLNode<T>? = head
        var previous: LLNode<T>? // initially nil
        var listIndex = 0
        
        // Move to the end of the list
        while listIndex < index {
            previous = current
            current = current?.next
            listIndex += 1
        }
        
        // Create the new node
        let newNode = LLNode<T>()
        
        newNode.key = key
        newNode.previous = previous
        newNode.next = current
        
        previous?.next = newNode
        current?.previous = newNode
        
    } //end function

    
    
    
    //remove at specific index
    func remove(at index: Int) {
        
        //check for indix out of bounds
        guard index >= 0 && index < count else {
            print("link index does not exist..")
            return
        }
        
        //determine if the removal is at the head
        guard index != 0 else {
            head = head?.next
            head?.previous = nil
            return
        }

        var current: LLNode<T>? = head
        var previous: LLNode<T>?    // initially nil
        var listIndex = 0
        
        // Move to the end of the list
        while listIndex <= index {
            previous = current
            current = current?.next
            listIndex += 1
        }
        
        
        previous?.next = current?.next
        previous?.next?.previous = previous
        
        current?.next = nil
        current?.previous = nil
        
    } //end function
    


    
    
  //reverse the order of a linked list
  func reverse() {
    
    //if count == 1 or count == 0,no need to reverse
    guard count > 1 else {
      return
    }

    
    var current = head
    var next: LLNode<T>?
    
    
    while current != nil {
        
      //reverse
      next = current?.next
      current?.next = current?.previous
      current?.previous = next
      
      
      if next == nil {
        head = current
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
    func filter(_ formula: (LLNode<T>) -> Bool) -> LinkedList<T>? {
        
        
        //check for instance
        guard let head = head else {
            return nil
        }
        
        
        var current: LLNode? = head
        let results = LinkedList<T>()
        
        
        while current != nil {
            
            //filter based on formula
            if formula(current!) {
                results.append(element: current!.key)
            }
            
            
            current = current?.next
        }
        
        
        return results
        
    }
    
    
    
    //map list content - higher order function
    func map(_ formula: (LLNode<T>) -> T) -> LinkedList<T>? {
        
        
        //check for instance
        guard let head = head else {
            return nil
        }
        
        
        var current: LLNode? = head
        let results = LinkedList<T>()
        
        while current != nil {
            
            //map based on formula
            let newKey = formula(current!)
            
            results.append(element: newKey)
            
            current = current?.next
        }
        
        
        return results
        
    }

    
    
    
} //end class






