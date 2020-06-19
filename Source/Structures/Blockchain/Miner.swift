//
//  Miner.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 6/1/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Miner: Member {
    
    
  internal var blockchain = LinkedList<Block>()
  internal var desc: String?

    
    init(balance: Float = 0.0, desc: String = "", model: inout Blockchain) {
        
        self.desc = desc
        self.blockchain = model.currentChain()
        
        
        let sBalance = Exchange(nil, self, balance, "starting balance..")
        model.newExchange(sBalance)

               
        //send reference
        model.newMember(item: self)
        
    }
        
    
    //check shared network
   func poll(model: inout Blockchain) {
       
    
        //obtain pending exchanges
        let plist = model.exchangeList(requester: self)

    
        if plist.count > 0 {

            
            //add audit to transactions
            for trans in plist {
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

            
            //receive reward
            let amount = model.sendreward(to: self)

            
            //publish intent
            let reward = Exchange(nil, self, amount, "mining reward..")
            model.newExchange(reward)
            
        }
        
    }
    
    
    
    
    //mine a new block - the miner does this as part of their local instance..
    private func mineBlock() -> Block {
        return Block()
    }
        
    
}
