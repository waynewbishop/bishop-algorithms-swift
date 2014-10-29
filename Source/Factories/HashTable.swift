//
//  HashTable.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import Foundation


class HashTable {
    
    private var bucket: Array<HashNode>!
    private var listsize: Int

    
    init() {
        self.bucket = Array<HashNode>()
        self.listsize = 0
    }
    
    
    //return the hash value to be used
    func createHash(firstname: String) -> Int! {
        
        var remainder: Int = 0
        var quotient: Int = 0
        

        for key in firstname.unicodeScalars {
            println("the ascii value of \(key) is \(key.value)..")
            quotient += Int(key.value)
            
        }
        
        
        /*
        note: use the quotient and modulus to find the remainder. The listsize is used
        as the modulus to ensure all possible outcomes are between 0 and the list size. This is a
        very slick solution.
        */
        
        remainder = quotient % 24
        

        return remainder
    }
    
    
}