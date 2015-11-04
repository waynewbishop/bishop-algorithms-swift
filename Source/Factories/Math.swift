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

    
    
    //build fibonacci sequence to a specified position - recursive
    func fib(n: Int, var sequence: Array<Int> = [0, 1]) {

        
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