//
//  Peer.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 06/08/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Peer: Blockable {

    
   internal var balance: Float = 0.0
   internal var description: String?
   internal var audit = Stack<Audit>()

    
   var blockchain = LinkedList<Block>()

    
    var bal: Float {
        
        //calculate my balance
        
        let blocks = blockchain.keys
        var value: Float = 0.0
        
        for b in blocks {
            if let exchanges = b.transactions {
                for e in exchanges {
                    if e.from.description == self.description {
                        value -= e.amount
                    }
                   
                    if e.to.description == self.description {
                        value += e.amount
                    }
                }
            }
        }
        
        return value
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
    
    
    //TODO: iterate through the linked list to calculate balances..
    
    
    func addfunds(_ amount: Float, requester: Miner) {
        
        audit.push(Audit(action: "debit", requester))
        self.balance += amount
    }
    
    
    func removefunds(_ amount: Float, requester: Miner) {
        
        audit.push(Audit(action: "credit", requester))
        self.balance -= amount
    }
    
    
}

