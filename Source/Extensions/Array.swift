//
//  Array.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/1/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


extension Array {
  
    
    //MARK: - Index Operations
    
    
    //returns the middle index
    func midIndex() -> Index {
        return startIndex + (count / 2)
    }
    
    
    //TODO: Remove these last two methods and update binary search - they just confuse readers..
    
    
    //returns the first index
    func minIndex() -> Index {
        return startIndex
    }
    
    
    //returns the max index
    func maxIndex() -> Index {
        return endIndex - 1
    }
    
}
