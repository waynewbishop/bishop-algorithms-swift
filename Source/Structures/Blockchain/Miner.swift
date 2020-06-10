//
//  Miner.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/1/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Miner {
  
    
  var blockchain = LinkedList<Block>()
  var description: String?
  var balance: Float = 0.0
    
    
    init(balance: Float = 0.0) {
        self.balance = balance
    }

    
    
    //check shared network
   func poll(model: inout Blockchain) {
       
        //obtain pending exchanges
        let plist = model.exchangeList(requester: self)


        for trans in plist {
            //TODO: Update balances of senders and receivers.
        }
    
    
        if plist.count > 0 {
            
            //receive reward for mining block.. update balance..
            self.balance += model.sendreward(to: self)

            
            //TODO:reset the number of main network transactions.
            
        }
    
        
    }
    
    
    
    
    //mine a new block - as part of this
    private func mineBlock() -> Block {
        return Block()
    }
        
    
}
