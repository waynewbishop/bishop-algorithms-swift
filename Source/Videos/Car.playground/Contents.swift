

//attributes for a car
struct CarType {
    
    var make = "", model = "", wheels = ""
    var seats = "", steering = ""
    var engine: Int = 0
}


class Car {
    
    var make = "", model = "", wheels = ""
    var seats = "", steering = ""
    var engine: Int = 0
    
    
    //only accessible from within the type
    private var isStarted: Bool = false
    
    
    init(type design: CarType) {
        
        //create instance based on attributes
        make = design.make
        model = design.model
        wheels = design.wheels
        seats = design.seats
        steering = design.steering
        engine = design.engine
    }
    

    
    //start the car..
    func startCar() {
        
        print("starting the engine..")
        
        switch engine {
        case 0:
            print("..it doesn't look like the car has an engine")
            isStarted = false
            
        case 1..<150:
            print("..moving along nicely")
            isStarted = true
            
        case 151..<800:
            print("..wow, this \(self.model) is fast!")
            isStarted = true
            
        default:
            print("..hmm, what kind of car is this?")
            isStarted = false
        }
    }
    
    
    
    func moveForward() {
        if self.isStarted {
            print("..moving forward!")
        }
    }
    
    
    func moveBackward() {
        if self.isStarted {
            print("..moving backward!")
        }
    }
    
    
    func turnLeft() {
        if self.isStarted {
            print("..turning left!")
        }
    }
    
    
    func turnRight() {
        if self.isStarted {
            print("..turning right!")
        }
    }
    


    //provides a summary of the the car design
    func printDesign() {
        print("\n-------------------")
        print("the car is a \(self.make), \(self.model)" )
        print("with \(self.wheels) wheels and \(self.engine) horsepower..")
    }
    
}


//define the type
let porshe: CarType = CarType(make: "911", model: "Porshe", wheels: "Pirelli", seats: "Ricardo", steering: "Porshe", engine: 560)

//create a new object based on the type
let racecar = Car(type: porshe)

//perform actions
racecar.startCar()
racecar.moveForward()
racecar.moveBackward()
racecar.turnLeft()

//print design
racecar.printDesign()


