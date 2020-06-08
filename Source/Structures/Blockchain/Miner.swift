//
//  Miner.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/1/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Miner {
  
    
  var chain = LinkedList<Block>()
  var description: String?
  var balance: Float = 0.0
  
    
    func updateBalance(with funds: Float) {
        self.balance = funds
    }
    
    
    
}
