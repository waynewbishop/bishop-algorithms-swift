Swift Structures
====================

This project provides a framework for commonly used data structures and algorithms written in a new iOS development language called <a href="http://www.swift.org" target="_blank">Swift</a>. While details of many algorithms exists on Wikipedia, these implementations are often written as pseudocode, or are expressed in C or C++. With Swift now officially released, its general syntax should be familiar enough for most programmers to understand.  


Audience
---------------------

As a developer, you should already be familiar with the basics of programming. Beyond algorithms, this project also aims to provide an alternative for learning the basics of Swift. This includes implementations of many Swift-specific features such as optionals, extensions, protocols and generics. Beyond Swift, audiences should be familiar with **Singleton** and **Factory** design patterns along with sets, arrays and dictionaries. 


Features
--------------------

The project features code-level examples for the following items:

+ [Linked Lists](/Source/Factories/LinkedList.swift)
+ [Binary Search](/Source/Extensions/Array.swift)
+ [Insertion Sort](/Source/Extensions/Array.swift)
+ [Bubble Sort](/Source/Extensions/Array.swift)
+ [Selection Sort](/Source/Extensions/Array.swift)
+ [Quick Sort](/Source/Extensions/Array.swift)
+ [Binary Search Trees](/Source/Factories/BSTree.swift)
+ [Tree Balancing - Rotations](/Source/Factories/BSTree.swift)
+ [Stacks](/Source/Factories/Stack.swift)
+ [Queues](/Source/Factories/Queue.swift)
+ [Heaps & Heapsort Operations](/Source/Factories/Heap.swift)
+ [Hash Tables](/Source/Factories/Hashtable.swift)
+ [Tries](/Source/Factories/Trie.swift)
+ [Graphs](/Source/Factories/Graph.swift)
+ [Dijkstra's Shortest Path](/Source/Factories/Graph.swift)
+ [Depth-First Search](/Source/Structures/BSNode.swift)
+ [Breadth-First Search](/Source/Factories/Graph.swift)
+ [Protocol Extensions](/Source/Extensions/Sortable.swift)
+ [Enumerations](/Factories/enumModel.swift)
+ [Fibonacci Numbers](/Source/Extensions/Int.swift)
+ Generics
+ Dyanmic Programming
+ [Closures](/SwiftTests/ClosureTest.swift)



The Book
--------------------
Now in its **4th edition** and supporting **Swift 4.2**, the <a href="http://shop.waynewbishop.com" target="_blank">The Swift Algorithms Book</a> features code and color illustrations that benefits students and professionals. As a collaborative open-source effort, I also welcome <a href="https://twitter.com/waynewbishop" target="_blank">feedback</a> and contribution from others. 


Example
--------------------

```swift
    //bfs traversal with inout closure function
    func traverse(_ startingv: Vertex, formula: (_ node: inout Vertex) -> ()) {

        
        //establish a new queue
        let graphQueue: Queue<Vertex> = Queue<Vertex>()
        
        
        //queue a starting vertex
        graphQueue.enQueue(startingv)
        
        
        while !graphQueue.isEmpty() {
            
            
            //traverse the next queued vertex - Swift 4.0
            //var vitem: Vertex! = graphQueue.deQueue()
            
            
            //traverse the next queued vertex
            guard var vitem = graphQueue.deQueue() else {
                break
            }
            
            //add unvisited vertices to the queue
            for e in vitem.neighbors {
                if e.neighbor.visited == false {
                    print("adding vertex: \(e.neighbor.key) to queue..")
                    graphQueue.enQueue(e.neighbor)
                }
            }
            
            //invoke formula
            formula(&vitem)

            
        } //end while
        
        
        print("graph traversal complete..")
                
    }
```

Getting Started
--------------------

Swift Structures has been optimized for **Swift 4.2** (e.g., Xcode 10.0) or later. The directories are organized as follows:
+ Source - Code for all Swift data structures, algorithms and source extensions
+ Example - An empty iOS single-view application template
+ SwiftTests - Unit tests with XCTest Framework

Usage
--------------------
Individuals are welcome to use the code with commercial and open-source projects. As a courtesy, please provide attribution to <a href="http://www.waynewbishop.com" target="_blank">waynewbishop.com</a>. For more information, review the complete <a href="https://github.com/waynewbishop/SwiftStructures/blob/master/License.md" target="_blank">license agreement</a>. 


Branches
--------------------
+ master - The production branch. Clone or fork this repository for the latest copy
+ develop - The active Swift 4.2 development branch. Swift 4.2 [pull requests](https://help.github.com/articles/creating-a-pull-request) should be directed to this branch



Other Projects
--------------------

+ <a href="https://github.com/EvgenyKarkan/EKAlgorithms" target="_blank">EKAlgorithms</a> - A set of computer exercises implemented in Objective-C
+ <a href="https://github.com/sagivo/algorithms" target="_blank">Algorithms</a> - A playground for common questions implemented in Ruby


Questions
--------------------

Have a question? Feel free to contact me on <a href="http://www.twitter.com/waynewbishop" target="_blank">Twitter</a> or <a href="http://www.waynewbishop.com/contact" target="_blank">online</a>.

