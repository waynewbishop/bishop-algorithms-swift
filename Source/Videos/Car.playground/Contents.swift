

//attributes for a car
struct CarDesign {
    
    var make = "", model = "", wheels = ""
    var seats = "", steering = ""
    var engine: Int = 0, weight = 0
}



class Car {
    
    var make = "", model = "", wheels = ""
    var seats = "", steering = ""
    var engine: Int = 0, weight = 0
    
    
    //only accessible from within the type
    private var isStarted: Bool = false
    
    
    init(type: CarDesign) {
        
        //initialize properties
        self.make = type.make
        self.model = type.model
        self.wheels = type.wheels
        self.seats = type.seats
        self.steering = type.steering
        self.engine = type.engine
        self.weight = type.weight
    }
    

    
    //start the car..
    func startCar() {
        
        print("starting the engine..")
        
        switch self.engine {
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

let porshe: CarDesign = CarDesign(make: "911", model: "Porshe", wheels: "Pirelli", seats: "Ricardo", steering: "Porshe", engine: 560, weight: 4000)

//create a new object based on the type
let racecar = Car(type: porshe)

//perform actions
racecar.startCar()
racecar.moveForward()
racecar.moveBackward()
racecar.turnLeft()

//print design
racecar.printDesign()


