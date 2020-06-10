//
//  Peer.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 06/08/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


 class Peer {
    
   var blockchain = LinkedList<Block>()
   var balance: Float = 0.0
   var description: String?
    
    
    //add references to main network
    init(balance: Float = 0.0, model: Blockchain){
        
        self.blockchain = model.currentChain()
        self.balance = balance
        
        model.newPeer(item: self)
        
    }
    
    
    //a pending exchange - only peer instance can issue transaction
    private func intent(to recipient: Peer, for amount: Float, model: inout Blockchain) {
        
        //TODO: Debit pending amount from peer balance? 
        if amount <= balance {
            let exchange = Exchange(self, recipient, amount)
            model.newExchange(exchange)
        }
        
    }

    
}

