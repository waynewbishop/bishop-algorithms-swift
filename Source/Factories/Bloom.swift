//
//  Bloom.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/2/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import Foundation

class Bloom {


    //initialize the filter
    private var bloomset: Array<Bool!>
    private var empty: Bool = true
    
    
    init(capacity: Int) {
        self.bloomset = Array<Bool!>(count: capacity, repeatedValue: nil)
    }


    
    //the number of set items
    var count: Int {
        return self.bloomset.count
    }

    
    //return set status
    var isEmpty: Bool {
        return empty
    }
    
    
    /*
     note: As shown, the concept of "adding" key element (eg. Strings) to a bloom filter doesn't
     take place. Unlike other structures, their goal is to test for membership.
    */

    
    func addWord(element: String) -> Bool {
        
        
        //track position indicies with tuple
        var position: (first: Int, second: Int, third: Int)
        
        
        //establish position "spread"
        position.first = self.createhash(element)
        position.second = self.createhash(String(position.first))
        position.third = self.createhash((String(position.second)))
 
        
        print("\(element) positions are: \(position)")
        

        /*
        note: All 3 positions are checked for existing membership. As a result, it is valid for
        their to be some overlap with existing positions.
        */
        
        

        //gaurd against collision
        if (bloomset[position.first] != nil) && (bloomset[position.second] != nil) && (bloomset[position.third] != nil) {
            print("word collision occurred..")
            return false
        }
        
        else {
            
            //flip boolean values at designated position
            bloomset[position.first] = true
            bloomset[position.second] = true
            bloomset[position.third] = true
            
            print("element: \(element) added to set..")
            print("----------")
            
            
            self.empty = false
            return true
            
        }
        
        
        
    }
    
    
    
    //check for membership
    func contains(element: String) -> Bool {
        
        
        //track positions with tuple
        var position: (first: Int, second: Int, third: Int)
        
        
        //establish position "spread"
        position.first = self.createhash(element)
        position.second = self.createhash(String(position.first))
        position.third = self.createhash((String(position.second)))
        

        //determine if found in any position
        if bloomset[position.first] == nil {
            return false
        }
        
        else if bloomset[position.second] == nil {
            return false
        }
            
        else if bloomset[position.third] == nil {
            return false
            
        }
        
        //all tests passed
        else {
            return true
        }
        
        
    } //end function

    
    

    //hash algorithm - calculates the spread
    private func createhash(element: String) -> Int! {
        
        var remainder: Int = 0
        var divisor: Int = 0

        
        /*
        note: modular math is used to calculate a hash value. The position count is used
        as the dividend to ensure all possible outcomes are between 0 and the collection size. 
        This is an example of a simple but effective hash algorithm.
        */
        
        
        for key in String(element).unicodeScalars {
            //print("the ascii value of \(key) is \(key.value)..")
            divisor += Int(key.value)
        }
        
        
        //assignment and divisibility check
        remainder = divisor % bloomset.count
        
        if remainder != 0 {
            remainder -= 1
        }
        
        
        return remainder
        
    }
    
    
    
}