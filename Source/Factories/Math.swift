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
    func fib(n: Int) -> Array<Int>! {
        
        
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

    
    
    func someFunction(parameterWithDefault: Int = 12) {
        // function body goes here
        // if no arguments are passed to the function call,
        // value of parameterWithDefault is 12
        
        someFunction(9)
    }
    
    
    
    /* 
     TODO: Recursive functions with parameters are still allowed in Swift. It's
     only the mutation of the variable within the method scope that isn't allowed.
     Just fix by providing a secondary "mutated" output variable..
    */
    
    
    //build fibonacci sequence to a specified position - recursive
    func fib(n: Int, var sequence: Array<Int> = [0, 1]) {

        someFunction()
        someFunction(6)
        
        //initialize sequence
        if n < 2 {
            return
        }
        
        
        let i: Int = sequence.count
        
        
        //set base condition
        if i == n {
            return
        }
        
        let results: Int = sequence[i - 1] + sequence[i - 2]
        sequence.append(results)

        
        //set iteration
        fib(n, sequence: sequence)
    
    }
    
    
    
    //build fibonacci sequence to a specified position - trailing closure
    func fib(n: Int, formula: Array<Int> -> Int) -> Array<Int>! {
                
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