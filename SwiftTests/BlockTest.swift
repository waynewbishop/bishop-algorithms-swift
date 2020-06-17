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
    
    var blockchain = Blockchain()
    
    
    override func setUp() {
        super.setUp()
    }
    
    
    func testSimpleNetwork() {

        
        let elliott = Peer(balance: 45, desc: "Elliott", model: blockchain)
        let karen = Peer(balance: 75, desc: "Karen", model: blockchain)
        let wayne = Peer(balance: 20, desc: "Wayne", model: blockchain)
    

        /*
        print("elliott: starting balance - \(elliott.bal)")
        print("karen: starting balance - \(karen.bal)")
        print("wayne: starting balance -\(wayne.bal)")
        */
        
        
        //plan pending exchange
        karen.intent(to: elliott, for: 20, model: &blockchain)

        
        //add new miner to the network
        let rishi = Miner(balance: 5, desc: "rishi", model: blockchain)

        
        //check network for pending transactions
        rishi.poll(model: &blockchain)
        
        
        print("elliott: ending balance - \(elliott.bal)")
        print("karen: ending balance - \(karen.bal)")
        print("wayne: ending balance -\(wayne.bal)")

        
        //check miner balance
        print("rishi: ending balance -\(rishi.bal)")
        
        
    }
    
}
