import Foundation


//attributes for any land vehical..
struct Vehical {
    
    var make = "", model = "", wheels = ""
    var seats = "", steering = ""
    var engine = 0, weight = 0
}



protocol Driveable {
    
    var vehical: Vehical {get}
    
    //actions for generic vehical
    func moveForward()
    func moveBackward()
    func turnLeft()
    func turnRight()
}


class VProduction<T: Driveable> {
    //note: only drivable vehicals can be produced at the production plant..
}


/*
 note: the production facility can build generic cars only. this is one
 purpose because like in the real world, we'll have specific equipment and actions
 to be performed to produce those items. To build something else like boats, we would
 have to extend our model with new capabilities. 
*/
