//
//  Int.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/1/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


extension Int: Keyable {
    
    
    //hash table requirement
    var keystring: String {
        return String(self)
    }

    
    //iterates the closure body a specified number of times
    func times(closure:(Int)-> Void) {
        for i in 0...self {
            closure(i)
        }
    }
    
        
    
    //build fibonacci sequence to a specified position - default
    func fibNormal() -> Array<Int>? {
        
        
        //check trivial condition
        guard self > 2 else {
            return nil
        }
        
        
        //initialize the sequence
        var sequence: Array<Int> = [0, 1]
        
        
        var i: Int = sequence.count
        
        while i != self {
            
            let results: Int = sequence[i - 1] + sequence[i - 2]
            sequence.append(results)
            
            i += 1
        }
        
        
        return sequence
        
    }
    
    
    //build fibonacci sequence to a specified position - recursive
    mutating func fibRecursive(_ sequence: Array<Int> = [0, 1]) -> Array<Int>? {
        
    
        var final = Array<Int>()
        
        
        //mutated copy
        var output = sequence

        
        //check trivial condition
        guard self > 2 else {
            return nil
        }

        
        let i: Int = output.count
        
        
        //set base condition
        if i == self {
            return output
        }
        
        
        let results: Int = output[i - 1] + output[i - 2]
        output.append(results)
        
        
        //set iteration
        final = self.fibRecursive(output)!
        
        
        return final
        
    }
    
    
    //build fibonacci sequence to a specified position - trailing closure
    func fibClosure(withFormula formula: (Array<Int>) -> Int) -> Array<Int>! {
        
        
        //check trivial condition
        guard self > 2 else {
            return nil
        }
        
        
        //initialize the sequence
        var sequence: Array<Int> = [0, 1]
        
        var i: Int = sequence.count
        
        while i != self {
            
            let results: Int = formula(sequence)
            sequence.append(results)
            
            i += 1
        }
        
        
        return sequence
        
        
    } //end function
    
    
    /*
    example of dynamic programming. Based on memoization, this nested function 
    produces the fibonacci sequence in linear time O(n). Also, note how the final
    answer is obtained in constant time O(1).
    */

    //calculate results
     func fibMemoized() -> Int {
 
        
        //builds array sequence
        func fibSequence(_ sequence: Array<Int> = [0, 1]) -> Array<Int> {
            
            print("fibSequence called..")
            
            var final = Array<Int>()
            
            
            //mutated copy
            var output = sequence
            
            
            let i: Int = output.count
            
            
            //set base condition - linear time O(n)
            if i == self {
                return output
            }
            
            
            let results: Int = output[i - 1] + output[i - 2]
            output.append(results)
            
            
            //set iteration
            final = fibSequence(output)
            
            return final
            
            
        } //end function
        
       
        
        //calculate final product - constant time O(1)
        let results = fibSequence()
        let answer: Int = results[results.endIndex - 1] + results[results.endIndex - 2]
        return answer
        
    }
    
    
}




