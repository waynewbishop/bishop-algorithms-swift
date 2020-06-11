//
//  Peer.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 06/08/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


 class Peer {
    
   private var balance: Float = 0.0
   private var description: String?
   var blockchain = LinkedList<Block>()

    
    var bal: Float {
        return self.balance
    }
    
    
    //add references to main network
    init(balance: Float = 0.0, desc: String = "", model: Blockchain){
        
        self.blockchain = model.currentChain()
        self.balance = balance
        self.description = desc
        
        model.newPeer(item: self)
        
    }
    
    
    //a pending exchange
    func intent(to recipient: Peer, for amount: Float, desc: String = "", model: inout Blockchain) {
        
        if amount <= balance {
            let exchange = Exchange(self, recipient, amount)
            model.newExchange(exchange)
        }
        
    }
    
    
    
    //MARK: Balance actions
    
    
    func addfunds(_ amount: Float, requester: Miner) {
        self.balance += amount
    }
    
    
    func removefunds(_ amount: Float, requester: Miner) {
        self.balance -= amount
    }
    
    
}

