//
//  Blockchain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class Blockchain: Graph {
    
    var chain = Array<Block>()
    var queue = Queue<Exchange>()
    
    
    let threshold: Int = 0
    let difficulty: Int = 0

    
    //initialize as an undirected graph
    init() {
      super.init(directed: false)
    }
    
    
    
    class Miner {
        
        
        func newBlock(network: Blockchain) {
            
            //TODO: use fast enumeration to iterate through the list
            //of peers and check for intended transactions. Once complete
            //, these "exchanges" are placed in the network queue.
            
            
            /*
             note: exchanges created are placed into the queue before they
             added into the main blockchain.
             */
            
            if network.queue.count < network.threshold {
              // network.queue.enQueue(exchange)
            }
        
            else {
              // network.queue.enQueue(exchange)
               self.push(network)
            }
            
            
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
            
            //grab items from the queue..
        
            
            //note: dequeued transactions are placed inside this object added to the created block..
            var transactions: Array<Exchange>?
            
        }
        
    }
    
}
