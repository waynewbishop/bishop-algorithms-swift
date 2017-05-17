//
//  Numbers.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 5/17/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation



class Numbers {
    
    
    let sequence: Array<Int>
    
    
    //basic initialization
    init(withSequence values: Array<Int>) {
        sequence = values
    }
    
    
    //determine if numbers are sorted
    func isSorted() -> Bool {
        
        //check trivial cases
        guard sequence.count <= 1 else {
            return true
        }
        
        var index = sequence.startIndex
        
        
        //compare sequence values
        while index < sequence.endIndex - 1 {
            if sequence[index] > sequence[sequence.index(after: index)] {
                return false
            }
            index = sequence.index(after: index)
        }
        
        return true
        
    }
    
}
