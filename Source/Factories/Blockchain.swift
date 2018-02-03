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
    
    var chain = Array<Block>()
    var queue = Queue<Block>()
    var canvas = Graph()
    

    //create a read only properties for threshold and complexity
    let threshold: Int = 0
    let difficulty: Int = 0


    //add a peer to the network
    func newPeer(name: String) {
        
        //note: the peer object is created here and is added to the graph..
        //let newPeer = Peer(name)
        
    }
    
    
    //identify a peer relationship
    func newEdge(source: Peer, destination: Peer, weight: Int) {
        
    }

    
    
    class Miner {
        
        
        //create a block
        func queueExchange(from: Peer,
                        to: Peer,
                        amount: Double,
                        network: Blockchain) -> Bool {
            /*
             note: exchanges are created here are placed into pending status before they
             added into the main blockchain.
             */
            
            
            /*
             note: check the count on the number of the number of exchanges
             in the Queue. Call push() to group all pending exhanges into a single block.
             */
            
            self.push(network)
            
            
            return false
        }
        
        
        private func push(_ network: Blockchain) {
            
            /*
            dequeue all pending exchanges from the main queue into a single block. now how the
            queue is a member of the overall graph and not the individual miner. As a result,
            other miner instances would theroetically be able to access the shared queue to
            push exchanges.
         
            This is also where the hash algorithm for each block obtained. For clarity, make the
            algorithm function an extension.
             
            */
            
            
            //note: dequeued transactions are placed inside this object added to the created block..
            var transactions: Array<Exchange>?
            
        }
        
    }
    
}
