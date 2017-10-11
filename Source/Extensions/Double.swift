//
//  Float.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 10/10/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation

extension Double: Keyable {

    
    //hash table requirement
    var keystring: String {
        return String(self)
    }
    
}
