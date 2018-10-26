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

public class Peer: Vertex {
    
   var chain: Array<Block>    
   private var intentions: Array<Exchange>
  
    
    override init(with name: String) {
        
        chain = Array<Block>()
        intentions = Array<Exchange>()
        
        super.init()
        super.key = name.identifierWithDate(date: lastModified)
    }
    
    
    //create pending exchange
    func intent(with to: Peer, for amount: Double) {
        
        let newExchange = Exchange(self.key,
                                   to.key, amount)
        
        intentions.append(newExchange)
    }


    //MARK: Miner Actions - only accessible
    

    func exchanges(requester miner: Blockchain.Miner) -> Array<Exchange> {
        return self.intentions
    }
    
    
    func flush(requester miner: Blockchain.Miner) -> () {
        self.intentions.removeAll()
    }
    
}

