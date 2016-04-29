//
//  Bloom.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/2/15.
//  Copyright © 2015 Arbutus Software Inc. All rights reserved.
//

import Foundation

class Bloom<T> {

    private var bloomset: Array<Bool>
    private var empty: Bool

    
    /*
    note: unlike other collections, the capacity of 100 does not limit the
    data structure to hold a limited number of items.
    */

    private let capacity: Int = 100

    
    
    init() {
        self.bloomset = Array<Bool>(count: capacity, repeatedValue: false)
        self.empty = true
    }
    

    
    //initialize with items
    convenience init(items: Array<T>) {
        
        self.init()             // Use default initalizer to init an empty bloom

        for s in items {
            self.addElement(s)
        }
        
    }
    
    
    var isEmpty: Bool {
        return empty
    }
    
    
    
    /*
     note: As shown, the concept of "adding" item elements to a bloom filter doesn't
     take place. The structure's goal is to test for membership.
    */

    
    func addElement(item: T) -> Bool {
        
        
        var position: (first: Int, second: Int, third: Int)
        
        
        //establish position "spread"
        position.first = hash(item)
        position.second = hash(position.first)
        position.third = hash(position.second)
        
        
        print("\(item) positions are: \(position)")
        

        
        /*
        note: All positions are checked for existing membership. As a result, it is valid for
        their to be 2 or less overlaping positions.
        */
        

        //gaurd against collision
        if (bloomset[position.first] && bloomset[position.second] && bloomset[position.third]) {
            print("word collision occurred..")
            return false
        }
        
        else {
            
            
            bloomset[position.first] = true
            bloomset[position.second] = true
            bloomset[position.third] = true
            
            print("element: \(item) added to set..")
            print("----------")
            
            
            self.empty = false
            return true
        }
        
        
        
    }
    
    
    
    //check for membership
    func contains(element: T) -> Bool {
        
        
        var position: (first: Int, second: Int, third: Int)
        
        
        //establish "spread"
        position.first = hash(element)
        position.second = hash(position.first)
        position.third = hash(position.second)
        
        
        print("position \(element) is \(position)..")

        
        //check positions
        
        if bloomset[position.first] &&
            bloomset[position.second] &&
            bloomset[position.third] {
                
            //all passed
            return true
                
        } else {
            return false
        }
    } //end function

    
    

    
    //hash algorithm - determines spread
    private func hash<T>(element: T) -> Int! {
        
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