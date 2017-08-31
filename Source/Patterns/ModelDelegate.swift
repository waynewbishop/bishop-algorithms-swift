//
//  Protocol.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 7/26/17.
//  Copyright © 2017 Arbutus Software Inc. All rights reserved.
//

import Foundation


//set conforming rules
protocol ModelDelegate {
    
    func willProcessContent(message: String)
    func didProcessContent(results: Int)
}
