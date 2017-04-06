//
//  interview.swift .swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 4/5/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation

/* 
 A class solution for common interview questions. While most of these 
 solitions are standalone, many of these borrow off more complex solutions
 available in this project.
*/

class Interview {
    
    
    /*
    note: implement an algorithm to determine if all characters are unique
    A check using unicode values ensures algorithm completeness (eg. capitals
    small case letters and special characters).
    */
 
    func isStringUnique(word keyword: String) -> Bool {
        
        //establish a container to hold results
        var results: Array = Array<Bool>()

        
        //find and check the unicode character value - O(n)
        for key in keyword.unicodeScalars {
            if results[Int(key.value)] == true {
                return false
            }
            
            results.insert(true, at: Int(key.value))
        }
        
     return true
        
    }
    
    
    
}
