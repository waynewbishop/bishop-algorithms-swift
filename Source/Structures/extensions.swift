//
//  extensions.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 8/20/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


extension String {
  
    
    //compute the length
    var length: Int {
        return self.characters.count
    }
    
    
    //returns characters up to a specified index
    func substringToIndex(to: Int) -> String {
        return self.substringToIndex(self.startIndex.advancedBy(to))
    }
    
    
    
    //return a character at a specific index
    func stringAtIndex(position: Int) -> String {
        return String(Array(self.characters)[position])
    }
    
    
    //replace string content
    func replace(string:String, replacement:String) -> String {
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement)
    }
    
    
    //removes empty string content
    func removeWhitespace() -> String {
        return self.replace(" ", replacement: "")
    }
    

    //insert a string at a specified index
    func insertSubstring(string:String, index:Int) -> String {
        return  String(self.characters.prefix(index)) + string + String(self.characters.suffix(self.characters.count-index))
    }

    
    //convert a string into a character array
    func characters() ->Array<Character>! {
        return Array(self.characters)
    }

    
    //reverse string order
    func reverse() -> String! {
                
        /*
        notes: While this operation would normally be done 'in-place', there are limited
        functions for manipulating native Swift strings. Even there is a
        native Array.reverse() method, this has been added as an example interview question.
        */

        
        //convert to array
        var characters = self.characters()
        
        var findex: Int = 0
        var bindex: Int = characters.count - 1
        
        
        while findex < bindex {
            
            //swap positions - inout parameters
            swap(&characters[findex], &characters[bindex])
            
            //update values
            findex += 1
            bindex -= 1
            
            
        } //end while
        
        
        return String(characters)
        
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



extension Array {
    
    //returns the middle index
    func midIndex() -> Index {
        return startIndex + (count / 2)
    }
    
    
    //returns the first index
    func minIndex() -> Index {
        return startIndex
    }
    
    
    //returns the max index
    func maxIndex() -> Index {
        return endIndex - 1
    }
    
}

