//
//  Bloom.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/2/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import Foundation

class Bloom<T> {

    //initialize the filter
    private var bloomset: Array<Bool!>
    
    
    init(capacity: Int) {
        self.bloomset = Array<Bool!>(count: capacity, repeatedValue: nil)
    }


    //hash a new value
    func add(element: T){
        
        //TODO: Use guard statement to check for nil value
        
        let positions = self.createhash(element)
        
        print("first position is: \(positions.first)")
        
        
        //TODO: Extract position values from tuple. flip bits on positions array..
        
    }
    
    
    //test for membership
    func contains(){        
    }
    

    //hash algorithm - computes three
    func createhash(element: T) ->(first: Int, second: Int, third: Int)! {
        
        
        var remainder: Int = 0
        var divisor: Int = 0

        
        if !(element is String) {
          return nil
        }

        
        //TODO: Test this to see if this works on complex value types..
        
        let somenode: LLNode<Int> = LLNode<Int>()
        var results = String(somenode).unicodeScalars
        
        
        for key in String(element).unicodeScalars {
            //println("the ascii value of \(key) is \(key.value)..")
            divisor += Int(key.value)
        }
        
        /*
        note: modular math is used to calculate a hash value. The bucket count is used
        as the dividend to ensure all possible outcomes are between 0 and 25. This is an example
        of a simple but effective hash algorithm.
        */
        
        remainder = divisor % bloomset.count
        
        
        return nil
    }

    
    func isEmpty() {
    }
    
}