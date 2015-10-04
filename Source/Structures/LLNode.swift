//
//  LList.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/7/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation

public class LLNode<T> {
    
    var key: T!
    var next: LLNode?
    var previous: LLNode?
	
	init(key: T!, next: LLNode?, previous: LLNode?)
	{
		self.key = key
		self.next = next
		self.previous = previous
	}
	
	func addSelf() {
		next?.previous = self
		previous?.next = self
	}
	
	func removeSelf()
	{
		previous?.next = next
		next?.previous = previous
	}
	
	func reverseSelf()
	{
		let temp = next
		next = previous
		previous = temp
	}
}

