//
//  Int.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/1/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


extension Int {
    
    //iterates the closure body a specified number of times
    func times(closure:(Int)->Void) {
        for i in 0...self {
            closure(i)
        }
    }
    
}


