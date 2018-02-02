//
//  Blockchain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation

typealias Graph = Array<Peer>


public class Blockchain {
    
    var queue = Queue<Block>()
    var canvas = Graph()
    

    //create a read only properties for threshold and complexity
    let threshold: Int = 0
    let complexity: Int = 0


    //add a peer to the network
    func addPeer(name: String) {
        //note: the peer object is created here and is added to the network..
    }
    
    
    //identify a peer relationship
    func addEdge() {
        
    }

    
    
    class Miner {
       
       //the miner also maintains a copy
       var chain = Array<Block>()
        
        
        //create a block
        func queueBlock(from: Peer, to: Peer, amount: Double) -> Bool {
            /*
             note: blocks are created here are placed into pending status before they
             added into the main blockchain. This is also where the
             hash algorithm for each block obtained. For clarity, make the
             algorithm function an extension.
             */
            
            
            /*
             note: check the count on the number of the number of transactions
             in the Queue. Call push() to add all pending blocks to the main chain..
             */
            
            return false
        }
        
        
        private func push() {
            //move all pending blocks to the main chain assuming the queue threshhold has been met..
        }
        
    }
    
}
