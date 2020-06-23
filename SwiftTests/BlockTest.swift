//
//  BlockTest.swift
//  SwiftTests
//
//  Created by Wayne Bishop on 2/4/18.
//  Copyright © 2018 Arbutus Software Inc. All rights reserved.
//

import XCTest

@testable import SwiftStructures


class BlockTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    
    func testSimpleNetwork() {

        
        var blockchain = Blockchain()
        
        
        /*
         note: add new members to the network. starting balances are posted
         pending transactions that are eventually added to the blockchain.
         */
        
        let elliott = Peer(balance: 45, desc: "elliott", model: &blockchain)
        let karen = Peer(balance: 75, desc: "karen", model: &blockchain)
        let wayne = Peer(balance: 20, desc: "wayne", model: &blockchain)

        
        
        /*
         note: peers and miners participate as "members" in the same network.
         using the common member protocol.
         */
        
        let phil = Miner(balance: 5, desc: "phil", model: &blockchain)

        
        /*
         this miner will process the opening peer opening balances and will
         receive a reward for mining a new block. Their reward is posted as
         another network pending transaction that will be processed when the next
         block is created.
         */
                
        phil.poll(model: &blockchain)
        
        
        
        print("elliott: starting balance: \(elliott.bal)")
        print("karen: starting balance: \(karen.bal)")
        print("wayne: starting balance: \(wayne.bal)")
        
        
         //check miner balance
         print("phil: starting balance: \(phil.bal)")
        
        
        
        
        //plan pending exchange
        karen.intent(from: karen, to: elliott, for: 20, desc: nil, model: &blockchain)

        
        
        //add a second miner to the network
        let rishi = Miner(balance: 5, desc: "rishi", model: &blockchain)

        
        /*
         note: check network for pending transactions. these transactions
         will include the 20 coin transfer to elliott as well as mining reward originally
         send to phil.
        */
        
        rishi.poll(model: &blockchain)
        
        
        print("elliott: ending balance: \(elliott.bal)")
        print("karen: ending balance: \(karen.bal)")
        print("wayne: ending balance: \(wayne.bal)")

        
        
        //check miner balance
        print("phil: ending balance: \(phil.bal)")
        print("rishi: ending balance: \(rishi.bal)")
        
        
    }
    
}
