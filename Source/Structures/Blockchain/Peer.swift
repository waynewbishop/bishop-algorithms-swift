//
//  Peer.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


 /*
 note: peers are graph vertices with their own unique characteristics.
 this includes the ability to own a copy of the network blockchain and publish their own public key.
 when peers want to complete transactions, they publish their "intention" for others (e.g. Miners).
 to review.
 */


 class Peer: Vertex, Blockable {
    
   var chain = LinkedList<Block>()
   var description: String?
  
   
    
   //pending transactions
   private var intentions = Array<Exchange>()
  
    
    
    override init(with name: String) {
        
        super.init()
        super.key = name.identifierWithDate(date: lastModified)
        self.description = name
    }
    
    
    //a pending exchange
    func intent(to destination: Peer, for amount: Double) {
        
        let newExchange = Exchange(self, destination, amount)
        intentions.append(newExchange)
    }

    
    
}

