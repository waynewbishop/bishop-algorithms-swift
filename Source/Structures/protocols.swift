//
//  protocols.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/30/16.
//  Copyright © 2016 Arbutus Software Inc. All rights reserved.
//

import Foundation


protocol Sortable {

  //generic sorting signature
  func IsSorted<T: Comparable>(_ sequence: T) -> Bool
    
}
