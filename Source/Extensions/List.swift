//
//  List.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/6/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation

extension HashList {
    

    
    //hash based on type
    func hashElement(_ element: T) -> (Int, HashResults) {
        
        
        var hashIndex: Int = 0
        
        
        /*
        note: test various types to determine how they should be hashed. This statement
        could be extended to support additional types.
        */
        
        switch element {
            
            
        //string type
        case is String:
            return (hashString(String(element)), HashResults.Success)
        
            
        //int type
        case is Int:
            
            let stringElement = String(element)
            return (hashString(stringElement), HashResults.Success)

            
        //naive bayes type
        case is BayesResult:

            
            //downcast and test
            if let result = element as? BayesResult {
                return (hashString(result.feature), HashResults.Success)
            }
            
            else {
                hashIndex = 0
            }
            
            
        default:
            hashIndex = 0
            return (hashIndex, HashResults.NoType)
        }
        
        
        return (hashIndex, HashResults.Fail)
        
    }
    
    
    //hash based on string
    func hashString(_ key: String) -> Int {
        
        var remainder: Int = 0
        var divisor: Int = 0
        
        for key in key.unicodeScalars {
            divisor += Int(key.value)
        }
        
        
        /*
         note: modular math is used to calculate a hash value. The bucket count is used
         as the dividend to ensure all possible outcomes are between 0 and the collection size.
         */
        
        remainder = divisor % buckets.count
        
        return remainder - 1
    }
    
    
    
} //end class
