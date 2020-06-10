//
//  Blockchain.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 06/08/20.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import Foundation


class Blockchain {
    
    
       /*
       notes: all blockchain resources are shared by peers and miners by reference.
       any change to shared resources by either type is reflected directly the blockchain.
       */
    
    
      private var intent = Array<Exchange>()
      private var blockchain = LinkedList<Block>()
    
      //entity types
      private var peers = Array<Peer>()
      private var miners = Array<Miner>()
      private var reward: Float = 20.0


    
    
      //MARK: peer function
    
      func newPeer(item: Peer) {
        self.peers.append(item)
      }

    
    
     
      //MARK: exchange functions
    
      func newExchange(_ exchange: Exchange) {
        intent.append(exchange)
      }
      
    
      func exchangeList(requester: Miner) -> Array<Exchange> {
         return self.intent
      }
    
    
        
    
    
      //MARK: mining functions
    
    
      //send a reward for mining block
      func sendreward(to requester: Miner) -> Float {
        return self.reward
      }
 
    
      //return current blockchain
      func currentChain() -> LinkedList<Block> {
          return blockchain
      }
    
    
      //update network and participants
      func updateChain(with newblock: Block) {
        
        /*
         note: all peers maintain a reference to the main network blockchain
         any change in this status is promoted to all participants
        */
        
        blockchain.append(newblock)
        
      }
              
        
}
