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
    
    
   //pending transactions - accessed by Miners
   var intentions = Array<Exchange>()

    
    
    //a pending exchange
    func intent(to destination: Peer, for amount: Double) {
        
        let exchange = Exchange(self, destination, amount)
        intentions.append(exchange)
    }

        
    
    func newBalance(of funds: Float, requester: Miner) {
        self.balance = funds
    }
    
}

