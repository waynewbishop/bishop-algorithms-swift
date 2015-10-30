//
//  Math.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Math {
    
    
    //build fibonnaci sequence to a specified position
    func fib(n: Int) ->Array<Int>! {
        
        
        if n < 2 {
            return nil
        }
        
        //initialize the sequence
        var sequence: Array<Int> = [0, 1]
        
        
        var i: Int = sequence.count
        
        while i != n {
            
            let results: Int = sequence[i - 1] + sequence[i - 2]
            sequence.append(results)
            
            i += 1
        }
        
        
        return sequence
        
    }

    
    
    //build fibonnaci sequence to a specified position
    func fibRecursive(n: Int, var sequence: Array<Int>!) {

        
        //initialize sequence
        if sequence == nil || sequence.count < 2 {
            sequence = [0, 1]
        }

        
        let i: Int = sequence.count
        
        
        //set base condition
        if i == n {
            
            for s in sequence {
                print("value is:\(s)")
            }
            
            return
        }
        
        let results: Int = sequence[i - 1] + sequence[i - 2]
        sequence.append(results)

        
        //set iteration
        fibRecursive(n, sequence: sequence)

    }
    
    
    
}