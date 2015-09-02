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

    
    //TODO: Research default members of the native Swift set type. Mimic functionality

    
    //hash a new value
    func add(){
        
        //TODO: Review how to extract values from a tuple
        
    }
    
    //test for membership
    func contains(){        
    }
    

    //hash algorithm
    func createhash(input: T) ->(position1: Int, position2: Int, position3: Int)! {
        return nil
    }
    
}