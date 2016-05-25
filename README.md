Swift Structures
====================

This project provides a framework for commonly used data structures and algorithms written in a new iOS development language called <a href="http://www.swift.org" target="_blank">Swift</a>. While details of many algorithms exists on Wikipedia, these implementations are often written as pseudocode, or are expressed in C or C++. With Swift now officially released, its general syntax should be familiar enough for most programmers to understand.  


Audience
---------------------

As a developer, you should already be familiar with the basics of programming. Beyond algorithms, this project also aims to provide an alternative for learning the basics of Swift. This includes implementations of many Swift-specific features such as optionals, extensions and generics. Beyond Swift, audiences should be familiar with Singleton and Factory design patterns along with sets, arrays and dictionaries. 


Features
--------------------

The project features code-level examples for the following items:

+ [Linked Lists](/Source/Factories/LinkedList.swift)
+ [Binary Search](/Source/Factories/Sorting.swift)
+ [Insertion Sort](/Source/Factories/Sorting.swift)
+ [Bubble Sort](/Source/Factories/Sorting.swift)
+ [Selection Sort](/Source/Factories/Sorting.swift)
+ [Quick Sort](/Source/Factories/Sorting.swift)
+ [Merge Sort](/Source/Factories/Sorting.swift)
+ [Fibonacci Numbers](/Source/Factories/Math.swift)
+ Generics
+ [Closures](/SwiftTests/ClosureTest.swift)
+ [Hash Tables](/Source/Factories/HashTable.swift)
+ [Bloom Filters](/Source/Factories/Bloom.swift)
+ [Binary Search Trees](/Source/Structures/AVLTree.swift)
+ [Tree Balancing - Rotations](/SwiftTests/AVLTest.swift)
+ [Tries](/Source/Factories/Trie.swift)
+ [Stacks](/Source/Factories/Stack.swift)
+ [Queues](/Source/Factories/Queue.swift)
+ [Graphs](/Source/Factories/Graph.swift)
+ [Dijkstra's Shortest Path](/Source/Factories/Graph.swift)
+ [Heaps & Heapsort Operations](/Source/Factories/PathHeap.swift)
+ [Depth-First Search](/Source/Structures/AVLTree.swift)
+ [Breadth-First Search](/Source/Factories/Graph.swift)

The Book
--------------------
Available in print, ePub or pdf format, <a href="http://shop.waynewbishop.com" target="_blank">The Swift Algorithms Book</a> features code and color illustrations that will benefit students and professionals. As a collaborative open-source effort, I also welcome <a href="https://twitter.com/waynewbishop" target="_blank">feedback</a> and <a href="http://shop.waynewbishop.com/pages/participate" target="_blank">contribution</a> from others. 


Example
--------------------

```swift
    /* graph traversal - breadth first search */
    
    func traverse(startingv: Vertex) {
        
        //establish a new queue
        let graphQueue: Queue<Vertex> = Queue<Vertex>()
        
        //queue a starting vertex
        graphQueue.enQueue(startingv)
        
        while !graphQueue.isEmpty() {
            
            //traverse the next queued vertex
            let vitem = graphQueue.deQueue() as Vertex!
            
            //add unvisited vertices to the queue
            for e in vitem.neighbors {
                if e.neighbor.visited == false {
                    print("adding vertex: \(e.neighbor.key!) to queue..")
                    graphQueue.enQueue(e.neighbor)
                }
            }
            
            vitem.visited = true
            print("traversed vertex: \(vitem.key!)..")
            
        } //end while
        
        print("graph traversal complete..")
        
    } //end function
```

Getting Started
--------------------

Swift Structures has been optimized for Xcode 7.3 (e.g., Swift 2.2) or later. The directories are organized as follows:
+ Source - Code for all Swift data structures and algorithms
+ Example - An empty iOS single-view application template
+ SwiftTests - Unit tests with XCTest Framework

Usage
--------------------
Individuals are welcome to use the code with commercial and open-source projects. As a courtesy, please provide attribution to <a href="http://www.waynewbishop.com" target="_blank">waynewbishop.com</a>. For more information, review the complete <a href="https://github.com/waynewbishop/SwiftStructures/blob/master/License.md" target="_blank">license agreement</a>. 


Branches
--------------------
+ master - The production branch. Clone or fork this repository for the latest copy
+ develop - The active development branch. <a href="https://help.github.com/articles/creating-a-pull-request" target=_blank">Pull requests</a> should be directed to this branch


Other Projects
--------------------

+ <a href="https://github.com/EvgenyKarkan/EKAlgorithms" target="_blank">EKAlgorithms</a> - A set of computer exercises implemented in Objective-C
+ <a href="https://github.com/sagivo/algorithms" target="_blank">Algorithms</a> - A playground for common questions implemented in Ruby


Questions
--------------------

Have a question? Feel free to contact me on <a href="http://www.twitter.com/waynewbishop" target="_blank">Twitter</a> or <a href="http://www.waynewbishop.com/contact" target="_blank">online</a>.

