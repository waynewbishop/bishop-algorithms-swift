//
//  Math.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/29/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Math {


    //MARK: Fibonacci algorithms
    
    
    //build fibonacci sequence to a specified position - default
    func fib(n: Int) -> [Int]? {
        
        guard n > 1 else { return nil }     // guarantee that position is 2 or more, we will return at least 2 elements or nil
        
        
        //initialize the sequence
        var sequence: Array<Int> = [0, 1]
        
        var i: Int = sequence.count
        
        while i != n {
            
            let nextFib: Int = sequence[i - 1] + sequence[i - 2]
            sequence.append(nextFib)
            
            i += 1
        }
        
        
        return sequence
        
    }

    
    
    //build fibonacci sequence to a specified position - recursive
    func fibRecursive(n: Int) -> [Int]? {

        guard n > 1 else { return nil }   // guarantee that position is 2 or more, else we return nil
        
        // set base condition as n == 2
        if n == 2 {
            return [0, 1]
        }
        
        
        /*
            recourse to the n-1 sequence and guard we should not get a nil sequence
            since at this point n should be at least 3
        */
        guard let prevSequence = fibRecursive(n - 1) else {
            assertionFailure("Fib recursion returned nil !!!")
            return nil
        }
        
        
        /*  
            at this point we know previous fib has n-1 elements with n - 1 >= 2
            thus the last two elements in previous sequence will have index
            n - 2 and n - 3
        */
        let nextFib = prevSequence[n - 2] + prevSequence[n - 3]
        return prevSequence + [nextFib]
    }
    
    
    
    //build fibonacci sequence to a specified position - trailing closure
    func fib(n: Int, formula: Array<Int> -> Int) -> Array<Int>? {
                
        if n < 2 {
            return nil
        }
        
        
        //initialize the sequence
        var sequence: Array<Int> = [0, 1]
        
        var i: Int = sequence.count
        
        while i != n {
            
            let results: Int = formula(sequence)
            sequence.append(results)
            
            i += 1
        }

        
        return sequence
        
        
    } //end function
    
    
}