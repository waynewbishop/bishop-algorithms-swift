//
//  SwiftFactory.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/7/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class LinkedList<T> {
    
	//the number of items
	private var _count: Int = 0
    
    //create a new LLNode instance 
    private var head: LLNode<T>?
    
    
   //the number of items (read-only property)
   var count: Int {
        
		return _count
                
    }
    
    
    
    //empty list check
    func isEmpty() -> Bool {
        
        // returns true if count is 0 or if the list's head is nil
			return _count == 0
        
    }
    
    
    
    //append a new item to a linked list
    func addLink(key: T) {
			let newValue: LLNode<T> = LLNode<T>(key: key, next: head, previous: nil)
			head?.previous = newValue
			head = newValue
			_count++
    }
    

    
    //print all keys for the class
    func printAllKeys() {
        
        var current: LLNode? = head
        
        print("------------------")
        
        //assign the next instance
        while (current != nil) {
            print("link item is: \(current?.key)")
            current = current?.next
        }
        
        
    }
    
    
    //MARK: Key & index operations
    
    
    //obtain link at a specific index
    func linkAtIndex(index: Int) throws ->LLNode<T>! {
		return try nodeAtIndex(index)
    } //end function



    //insert at specific index
	public func addLinkAtIndex(key: T, index: Int) throws -> Void {
		guard index != 0 else {
			addLink(key)
            return
        }
		let current = try nodeAtIndex(index)
		let childToUse: LLNode<T> = LLNode<T>(key: key, next: current, previous: current!.previous)
		current!.previous?.next = childToUse
                current!.previous = childToUse
    }

    //remove at specific index
	func removeLinkAtIndex(index: Int) throws {
		guard index != 0 else {
			guard _count > 0 else {
				return
			}
			head = head?.next
			head?.previous = nil
			_count--
            return
        }
		let current = try nodeAtIndex(index)
		current!.previous?.next = current?.next
		current!.next?.previous = current?.previous

	} //end function
        

        
	func nodeAtIndex(index: Int) throws -> LLNode<T>?
	{
		guard index >= 0 else {
			throw IndexingError.Underflow
		}
		guard index < _count else {
			throw IndexingError.Overflow
		}
        
		var current: LLNode<T>? = head
		var count: Int = 0
		while (index != count++) {
            current = current?.next
        }
		return current
            }
            
    
  //reverse the order of a linked list
  func reverseLinkedList() {
    
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
        
    }//end while
    
    
  }//end function
    
  
    
    //MARK: Closure operations
    

    
    /*
    notes: These "generic methods" mimic the map & filter array
    functions found in the Swift standard library.
    */
    
    
    //filter list content - higher order function
    func filter(formula: LLNode<T> -> Bool) -> LinkedList<T>! {
        
        
        var current: LLNode? = head
        let results: LinkedList<T>! = LinkedList<T>()
        
        
        while current != nil {
            
            //filter based on formula
            if formula(current!) == true {
                results.addLink(current!.key)
            }
            
            
            current = current?.next
        }
        
        
        return results
        
    }
    
    
    
    //map list content - higher order function
    func map(formula: LLNode<T> -> T) -> LinkedList<T>! {
        
        
        var current: LLNode? = head
        let results: LinkedList<T>! = LinkedList<T>()
        var newKey: T!
        
        
        while current != nil {
            
            //map based on formula
            newKey = formula(current!)
            
            //add non-nil entries
            if newKey != nil {
                results.addLink(newKey)
            }
            
            
            current = current?.next
        }
        
        
        return results
        
    }

    
    
    
} //end class






