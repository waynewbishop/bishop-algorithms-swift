//
//  Blockchain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 1/31/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


public class Blockchain: Graph {
    
    var chain =  Array<Block>()
    var queue = Queue<Exchange>()
    var threshold: Int


    init(ithreshold: Int = 3) {
        
      threshold = ithreshold
      super.init(directed: false)


      chain.append(genesisBlock())
    }
    
    
    
//MARK: helper functions

    
    //starting block
    private func genesisBlock()-> Block {
        
        let firstBlock = Block()
        
        firstBlock.id = blockIdentifier()
        firstBlock.description = "Genesis Block"
        
        return firstBlock
    }

    
    //broadcast latest block to peers
    func broadcast(to peer: inout Peer) {
        peer.chain = self.chain
    }

    
    
    //obtain latest block
    private func currentBlock()-> Block {
        return chain[chain.endIndex - 1]
    }
    
    
    //generate block identifier (e.g. potential mining operation..)
    private func blockIdentifier() -> String {
        return UUID().uuidString
    }
    

    
    
    class Miner {
        
        
        //poll the network for pending exchanges..
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
                let intentions = peer.exchanges(requester: self)

                
                for exchange in intentions {
                    
                    
                    //queue exchange
                    queue.enQueue(exchange)
                    print("queued exchange of $\(exchange.amount).")
                    
                    
                    if queue.count == threshold {
                        
                        /*
                         note: due to the potential complexity in mining
                         a new block, this process would be initiated through an
                         asynchronous process.
                         */
                        
                        let newBlock = self.createBlock(for: network)
                        
                        
                        //update main network chain
                        network.chain.append(newBlock)
                        
                    }
                    
                 } //end for
 
                
                 peer.flush(requester: self)
                 peer.visited = true
                
            }
            
        }
        

        
        private func createBlock(for network: Blockchain) -> Block {
            
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
            
            while queue.count != 0 {
                if let exchange = queue.deQueue() {
                    transactions.append(exchange)
                }
            }
            
            
            //build the new block
            newblock.miner = self
            newblock.id = network.blockIdentifier()
            newblock.previous = network.currentBlock().id
            newblock.transactions = transactions
            
            return newblock
            
        }
        
    }
    
}
