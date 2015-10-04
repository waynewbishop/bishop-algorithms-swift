//
//  SwiftFactory.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/7/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class LinkedList<T>: SequenceType, ArrayLiteralConvertible {
	
	init()
	{
	}
	
	init(values: Array<T>!)
	{
		//append list items
		for value in values.reverse() {
			self.addLink(value)
		}
	}
	
	//the number of items
	private var _count: Int = 0
    
	//create a new LLNode instance
	var head: LLNode<T>?
	
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
		head = addNode(key, next: head, previous: nil)
	}
	
	func removeLink()
	{
		head = removeNode()
	}
	
	func addNode(key: T!, next: LLNode<T>?, previous: LLNode<T>?) -> LLNode<T>
	{
		let node = LLNode<T>(key: key, next: next, previous: previous)
		defer {
			node.addSelf()
			_count++
		}
		return node
	}
	
	func removeNode() -> LLNode<T>?
	{
		let node = head
		defer {
			node?.removeSelf()
			_count--
		}
		return head?.next
	}
	
	//print all keys for the class
	func printAllKeys() {
		
		print("------------------")
        
		//assign the next instance
		for current in self {
			print("link item is: \(current.key)")
		}
	}
	
	//MARK: Key & index operations

	//obtain link at a specific index
	func linkAtIndex(index: Int) throws ->LLNode<T>! {
		return try nodeAtIndex(index)
	} //end function


	//insert at specific index
	public func addLinkAtIndex(key: T, index: Int) throws -> LLNode<T>? {
		let current = try nodeAtIndex(index)
		guard index != 0 else {
			addLink(key)
			return head
		}
		return addNode(key, next: current, previous: current.previous)
	}

	//remove at specific index
	func removeLinkAtIndex(index: Int) throws -> LLNode<T>? {
		let current = try nodeAtIndex(index)
		guard (index != 0) else {
			removeLink()
			return head
		}
		defer { _count-- }
		current.removeSelf()
		return current
	} //end function
        
	func nodeAtIndex(index: Int) throws -> LLNode<T>
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
		return current!
	}
    
	//reverse the order of a linked list
	func reverseLinkedList() {
	
		var next : LLNode<T>? = head
		
		for current in self {
			//reverse
			defer {
				current.reverseSelf()
			}
			if (current.next == nil)
			{
				head = current
			}
		}
	}//end function
	
	//MARK: Closure operations
	
	//SequenceType
	public func generate() -> AnyGenerator<LLNode<T>>
	{
		var node:LLNode<T>? = head
		return anyGenerator {
			if (node != nil)
			{
				defer { node = node?.next }
				return node
			}
			return nil
		}
	}
	
	func combine(result: LLNode<T>?, value: T) -> LLNode<T>? {
		return addNode(value, next: result, previous: nil)
	}
	
	//ArrayLiteralConvertible
	public required init(arrayLiteral elements: T...)
	{
		head = elements.reverse().reduce(head, combine: self.combine)
	}

	/*
	notes: These "generic methods" mimic the map & filter array
	functions found in the Swift standard library
	*/
	
	//filter list content - higher order function
	func filter(formula: LLNode<T> -> Bool) -> LinkedList<T> {
		
		let results: LinkedList<T> = LinkedList<T>()
		
		for current in self {
			
			//filter based on formula
			if formula(current) == true {
				results.addLink(current.key)
			}
		}
		
		return results
	}
	
	//map list content - higher order function
	public func map(formula: LLNode<T> -> T) -> LinkedList<T> {
		
		let results: LinkedList<T> = LinkedList<T>()
		var newKey: T!
	
		for current in self {
			//map based on formula
			newKey = formula(current)
			
			//add non-nil entries
			if newKey != nil {
				results.addLink(newKey)
			}
		}
		
		return results
	}
} //end class






