//
//  Keyable.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/10/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


//note: an extension on a protocol

extension Keyable {
    
    
    //compute table index
    func hashValue<T>(for key: String!, using buckets: Array<T>) -> Int {
        
        
        var remainder: Int = 0
        var divisor: Int = 0

        
        //trivial case
        guard key != nil else {
            return -1
        }
        
        
        for item in key.unicodeScalars {
            divisor += Int(item.value)
        }
        
        
        /*
         note: modular math is used to calculate a hash value. The bucket count is used
         as the dividend to ensure all possible outcomes are between 0 and the collection size.
         */
        
        remainder = divisor % buckets.count
        
        return remainder
    }
    
}




