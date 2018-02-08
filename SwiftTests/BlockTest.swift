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
    
    var PeerA = Peer(with: "John Hobbs")
    var PeerB = Peer(with: "Frank Smith")
    var PeerC = Peer(with: "Albert Einstien")
    
    
    override func setUp() {
        super.setUp()
        
        //add the vertices
        blockchain.addVertex(element: PeerA)
        blockchain.addVertex(element: PeerB)
        blockchain.addVertex(element: PeerC)

        
        //add the edges
        blockchain.addEdge(source: PeerA, neighbor: PeerB, weight: 1)
        blockchain.addEdge(source: PeerB, neighbor: PeerC, weight: 1)        
    }
    
    
    //simulate the intended tranactions
    func testQueuedTranactions() {
        
        //TODO: Create exchanges that are passed to a miner instance for processing..
        
    }
    
}
