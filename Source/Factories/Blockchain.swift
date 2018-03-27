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
    
    
    let threshold: Int = 0
    let difficulty: Int = 0

    
    //initialize as an undirected graph.
    init() {
        
      chain = Array<Block>()
      queue = Queue<Exchange>()
        
      super.init(directed: false)
    }
    
    
    
    class Miner {
        
        func poll(startingv: Peer, network: Blockchain) {
            
            /*
             note: this sequence performs a graph traversal via bfs
             (breadth-first search). Note the trailing closure declared
             as an inout variable. This provides the mechanisim to update effected
             peer nodes "by reference".
            */
            
            network.traverse(startingv) { ( node: inout Vertex) -> () in
                
                //trival case
                guard let peer = node as? Peer else {
                     return
                }
                
 
                for exchange in peer.intentions {
                    
                     /*
                     note: exchanges are queued before they are
                     added into the main blockchain.
                     */
                    
                    let queue = network.queue
                    let threshold = network.threshold
                    
                    //queue items depending on the network threshold. 
                    if queue.count <= threshold {
                        queue.enQueue(exchange)
                    }
                    
                    
                    if queue.count == threshold {
                        
                        //create new block
                        self.mineBlock(for: network)
                        
                        //remove pending transactions
                        peer.intentions.removeAll()
                    }
                 }
                
                 peer.visited = true
            }
            
        }
        
        
        private func mineBlock(for network: Blockchain) {
            
            //esablish queue
            let queue = network.queue
            var transactions = Array<Exchange>()
            
            
            //dequeue exchanges to
            queue.count.times { (value: Int) in
                
            }
            
            /*
            dequeue all pending exchanges from the main queue into a single block. now how the
            queue is a member of the overall graph and not the individual miner. As a result,
            other miner instances would theroetically be able to access the shared queue to
            push exchanges.
         
            This is also where the hash algorithm for each block obtained. For clarity, make the
            algorithm function an extension.
            */
            
          
            
        }
        
    }
    
}
