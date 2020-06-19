//
//  Member.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/19/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


//extension of a protocol

extension Member {
    
      /*
      note: peers and miners are different types that share membership in the
      same blockchain network. As a result, they both maintain their own account balances.
      As shown, this value is calculated based on the contents of the blockchain.
      */

    
       var bal: Float {
           
           //obtain list keys
           let blocks = blockchain.keys
           var value: Float = 0.0

           
           //iterate through blocks
           for b in blocks {
               
               if let exchanges = b.transactions {
                   for e in exchanges {
                                           
                       if let from = e.from {
                           if from.desc == self.desc {
                               value -= e.amount
                           }
                       }
                       
                       if e.to.desc == self.desc {
                           value += e.amount
                       }
                       
                   }
               }
           }
           
           return value
       }
    
}
