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
    
    var bitcoin = Blockchain()
    
    var PeerA = Peer(with: "John Hobbs")    
    var PeerB = Peer(with: "Frank Smith")
    var PeerC = Peer(with: "Albert Einstien")
    var PeerD = Peer(with: "Steve Jobs")
    
    
    override func setUp() {
        super.setUp()
    }
    
    
}
