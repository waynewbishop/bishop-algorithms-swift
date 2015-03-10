//
//  extensions.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/20/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation



extension String {
  
    
    //compute the length of string
    var length: Int {
        return countElements(self)
    }
    
    //returns characters of a string up to a specified index
    func substringToIndex(to: Int) -> String {
        return self.substringToIndex(advance(self.startIndex, to))
    }
    
    
    //return a character at a specific index
    func characterAtIndex(position: Int) -> String {
        return String(Array(self)[position])
    }
    
}


extension Int {
	
    //iterates the closure body a specified number of times
	func times(closure:(Int)->Void) {
		for i in 0...self {
			closure(i)
		}
	}
	
}