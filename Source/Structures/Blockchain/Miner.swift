//
//  Miner.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/1/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Miner {
    
  
  //TODO: Update Miner model to work as a protocol (and extension). 
    
    
  var blockchain = LinkedList<Block>()
  var description: String?
  private var balance: Float = 0.0

    
    init(balance: Float = 0.0, desc: String = "", model: Blockchain) {
        
        self.balance = balance
        self.description = desc
        self.blockchain = model.currentChain()
    }
    

    var bal: Float {
        return self.balance
    }
    
    
    //check shared network
   func poll(model: inout Blockchain) {
       
    
        //obtain pending exchanges
        let plist = model.exchangeList(requester: self)

    
        if plist.count > 0 {
            
            
            for trans in plist {
                
                let amount = trans.amount

                //TODO: recheck funds availability before removal..perhaps this function needs to ba boolean..
                trans.from.removefunds(amount, requester: self)
                trans.to.addfunds(amount, requester: self)
                trans.miner = self
            }
            
            
            //mine new block
            let newblock = self.mineBlock()
            
            newblock.transactions = plist
            newblock.miner = self
            newblock.description = "test block.."
            
            
            model.updateChain(with: newblock)

            
            //clear processed transactions..
            model.clearExchange(requester: self)

            
            //receive mining reward
            self.balance += model.sendreward(to: self)
        }
        
    }
    
    
    
    
    //mine a new block - the miner does this as part of their local instance..
    private func mineBlock() -> Block {
        return Block()
    }
        
    
}
