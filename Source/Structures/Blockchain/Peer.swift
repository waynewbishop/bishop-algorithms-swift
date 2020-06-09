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
    
    
    init(balance: Float = 0.0, model: Blockchain){
        
        //add references to main network
        
        self.blockchain = model.currentChain()
        self.balance = balance
        
        model.newPeer(item: self)
        
    }
    
    
    //a pending exchange - private to ensure only the peer instance can send transaction
    private func intent(to recipient: Peer, for amount: Float, model: inout Blockchain) {
        
        if amount <= balance {
            let exchange = Exchange(self, recipient, amount)
            model.newExchange(exchange)
        }
        
    }


    
    //revised balance
    func newBalance(of funds: Float, requester: Miner) {
        self.balance = funds
    }
    
}

