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
    func createHash(withElement element: T) -> Int {
        
        var hashIndex: Int = 0
        
        
        //TODO: Continue adding the other Int and BayesResult types
        
        
        switch element {
            
            
        //string type
        case is String:
            return hashString(String(element))
            
            
        default:
            hashIndex = 0
        }
        
        
        return hashIndex
        
    }
    
    
    func hashString(_ element: String) -> Int {
        
        var remainder: Int = 0
        var divisor: Int = 0
        
        for key in element.unicodeScalars {
            divisor += Int(key.value)
        }
        
        
        /*
         note: modular math is used to calculate a hash value. The bucket count is used
         as the dividend to ensure all possible outcomes are between 0 and the collection size.
         */
        
        remainder = divisor % buckets.count
        
        return remainder - 1
    }
    
    
}
