//
//  Stack.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/1/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Stack<T> : LinkedList<T> {
	
	override init()
	{
		super.init()
	}
	
	//push an item onto the stack
	func push(key: T) {
		super.addLink(key)
	}
	
	//remove an item from the stack
	func pop() -> T? {
		defer {
			super.removeLink()
		}
		return super.head?.key
	}
	
	//retrieve the top most item
	func peek() -> T? {
		return super.head?.key
	}
}