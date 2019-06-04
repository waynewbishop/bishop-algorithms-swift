import Foundation


protocol Driveable {
    
    //drivable properties
    var make: String {get}
    var model: String {get}
    var wheels: String {get}
    var seats: String {get}
    var steering: String {get}
    var engine: Int {get}
    var weight: Int {get}

    
    //drivable actions
    func moveForward()
    func moveBackward()
    func turnLeft()
    func turnRight()
}


//extension on a protocol
extension Driveable {
    
    func moveForward() {
        if (engine > 0) && (steering != "") {
            print("vehical \(make) is moving forward!")
        }
    }
    
    
    func moveBackward() {
        if (engine > 0) && (steering != "") {
            print("vehical \(make) is moving backward!")
        }
    }
    
    
    func turnLeft() {
        if (engine > 0) && (steering != "") {
            print("vehical \(make) is turning left!")
        }
    }

    
    func turnRight() {
        if (engine > 0) && (steering != "") {
            print("vehical \(make) is turning right!")
        }
    }
    
}


/*
 note: the production facility can build generic vehicals only. similar
 to the real world, our procuction plant will have specific needs and
 requirements when manufacturing vehicals versus other items such as
 boats or planes.
 */

class VProduction <T: Driveable> {
    
   private var items = Array<T>()
   
    
    func newVehical(element: T) {
        
        //test vehical before adding to production
        print(element.moveForward())
        print(element.moveBackward())
        print(element.turnLeft())
        
        items.append(element)
        print("item \(element.make) produced..")
    }
    
}


/*
 note: the generic model of a car. note how the behavior
 of the car is bound to the protocol. This could allow different
 types to be created (e.g. trucks or buses) that could also
 conform to Driveable
*/

struct Car: Driveable {
    
    var make = "", model = "", wheels = ""
    var seats = "", steering = ""
    var engine: Int = 0, weight: Int = 0
}



var BMW = Car(make: "BMW", model: "3251", wheels: "Pirelli", seats: "BMW",
              steering: "BMW", engine: 550, weight: 3000)


var production = VProduction<Car>()
production.newVehical(element: BMW)


