//
//  Peer.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 06/08/20.
//  Copyright © 2020 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Peer: Member {

    
   internal var desc: String?
   internal var audit = Stack<Audit>()
   var blockchain = LinkedList<Block>()
    
    
    
    //add references to main network
    init(balance: Float = 0.0, desc: String = "", model: inout Blockchain){
        
        self.blockchain = model.currentChain()
        self.desc = desc
        
        
        let sBalance = Exchange(nil, self, balance, "starting balance..")
        model.newExchange(sBalance)

        
        model.newMember(item: self)
        
    }
    
    
    //a pending exchange
    func intent(from: Member?, to recipient: Member, for amount: Float, desc: String?,
                model: inout Blockchain) {
        

        //publish exchange to model
        let exchange = Exchange(from, recipient, amount, desc)
        model.newExchange(exchange)
                
    }
    
    
}

