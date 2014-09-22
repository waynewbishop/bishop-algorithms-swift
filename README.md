Swift Structures
====================

This project provides a framework for commonly used data structures and algorithms written in a new iOS development language called <a href="http://developer.apple.com/swift" target="_blank">Swift</a>. While details of many algorithms exists on Wikipedia, these implementations are often written as pseudocode, or are expressed in C or C++. With Swift now officially released, its general syntax should be familiar enough for most programmers to understand.  


Audience
---------------------

As a developer, you should already be familiar with the basics of programming. Beyond algorithms, this project also aims to provide an alternative for learning the basics of Swift. This includes implementations of many Swift-specific features such as optionals, extensions and generics. Beyond Swift, audiences should be familiar with Singleton and Factory design patterns along with sets, arrays and dictionaries. 


Features
--------------------

The project features code-level examples for the following items:

+ Linked Lists
+ Binary Search
+ Insertion Sort
+ Bubble Sort
+ Generics
+ Binary Search Trees
+ Stacks & Queues
+ Graphs
+ Dijkstra's Shortest Path
+ Heaps & Heapsort Operations

I plan to write further additional examples of algorithms and all developers are welcome to follow the project through Github or online at <a href="http://www.waynewbishop.com/swift" target="_blank">www.waynewbishop.com/swift</a>. As a collaborative open-source effort, I also welcome <a href="https://twitter.com/waynewbishop" target="_blank">feedback</a> and <a href="https://help.github.com/articles/be-social" target="_blank">contribution</a> from others. 


Code Example
--------------------

```
  /* graph traversal - breadth first search */
  
   func traverseGraphBFS(startingv: Vertex) {

        //establish a new queue
        var graphQueue: Queue<Vertex> = Queue<Vertex>()
    
    
        //queue a starting vertex
        graphQueue.enQueue(startingv)
    
        while(!graphQueue.isEmpty()) {
            
            //traverse the next queued vertex
            var vitem = graphQueue.deQueue() as Vertex!
            println("traversed vertex: \(vitem.key as String!)..")
            vitem.visited = true
            
            
            //add unvisited vertices to the queue
            for e in vitem.neighbors {
                if e.neighbor.visited == false {
                    println("adding vertex: \(e.neighbor.key as String!) to queue..")
                    graphQueue.enQueue(e.neighbor)
                }
            }
            
        } //end while
    
    
        println("graph traversal complete..")
    
    
    } //end function
```

Getting Started
--------------------

Running Swift Structures requires Xcode 6.0 GM Seed or later. The directories are organized as follows:
+ Source - Code for all Swift data structures and algorithms
+ Example - An empty iOS single-view application template
+ SwiftTests - Unit tests with XCTest Framework

Questions
--------------------

Have a question? Feel free to contact me on <a href="http://www.twitter.com/waynewbishop" target="_blank">Twitter</a> or <a href="http://www.waynewbishop.com/contact" target="_blank">online</a>.

