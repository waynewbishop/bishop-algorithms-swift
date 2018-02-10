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
 this includes the ability to own a copy of their network blockchain and publish a public key.
 when peers want to complete transactions, they publish their "intention" for others (e.g. Miners).
 to review and approve.
 */

public class Peer: Vertex {
    
   var chain: Array<Block>?
   var intentions: Array<Exchange>?

    
   override init(with name: String) {
       super.init()
       super.key = name.identifierWithDate(date: lastModified)
    }
    
    
    //publish the intended transaction
    func exchange(with to: Peer, amount: Double) {
    
        let newExchange = Exchange(from: self, to: to, amount: amount)
        intentions?.append(newExchange)
    }
    
    
}

