//
//  Blockchain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class Blockchain: Graph {
    
    var chain: Array<Block>
    var queue: Queue<Exchange>
    
    
    //todo: change these to init parameters..
    let threshold: Int = 3
    let difficulty: Int = 25

    
    //initialize as an undirected graph.
    init() {
        
      chain = Array<Block>()
      queue = Queue<Exchange>()

      super.init(directed: false)
        
        
      //initialize chain with genesis block
      self.addBlock(genesisBlock())
    }
    
        
    class Miner {

        
        func poll(startingv: Vertex, network: Blockchain) {
            
            /*
             note: this sequence performs a graph traversal via bfs
             (breadth-first search). Note the trailing closure declared
             as an inout variable. This provides the mechanisim to update effected
             peers "by reference".
            */
            
            network.traverse(startingv) { ( node: inout Vertex) -> () in
                
                //trival case
                guard let peer = node as? Peer else {
                     return
                }
                
                
                 /*
                 note: exchanges are queued before they are
                 added into the main blockchain.
                 */
                
                let queue = network.queue
                let threshold = network.threshold
                //let chain = network.chain
 

                for exchange in peer.intentions {
                    
                    //queue items depending on the network threshold. 
                    if queue.count <= threshold {
                        queue.enQueue(exchange)
                        print("queued exchange of $\(exchange.amount).")
                    }
                    
                    
                    if queue.count == threshold {
                        
                        /*
                         note: due to the potential complexity in mining
                         a new block, this process would be iniated through a
                         asynchronous process.
                         */
                        
                        if self.newBlock(for: network) != true {
                            print("unable to create new block..")
                            return
                        }
                                                                        
                        //remove pending transactions
                        peer.intentions.removeAll()
                    }
                 }
                
                 peer.visited = true
            }
            
        }
        
        
        private func newBlock(for network: Blockchain) -> Bool {
            
            //establish queue
            let queue = network.queue
            let newblock = Block()
            var transactions = Array<Exchange>()
            
            
            /*
             note: dequeue all pending exchanges from the main queue into a single block. note how the
             queue is a member of the network a not the specific Miner. As a result,
             other miner instances could theroetically access the shared queue to
             push exchanges.
            */

            queue.count.times { (value: Int) in
                
                if let exchange = queue.deQueue() {
                  transactions.append(exchange)
                }
            }
            
            
            //build the new block
            newblock.miner = self
            newblock.previous = network.currentBlock().key
            newblock.transactions = transactions
            //newblock.key = network.hashValue(newblock)
            
            /*
            note: This is also where the hash algorithm for each block obtained. For clarity, make the
            algorithm function an extension.
            */
            
            return false
        }
        
    }
    
}
