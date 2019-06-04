import Foundation


/*
 note: generics can be combined protocols
 to provide specific and commonly shared functionality.
*/

protocol Floatable {
    //...
}

protocol Flyable {
    //..
}


class Vessels: Floatable {
    //boats, yachts etc..
}

class Seaplane: Floatable, Flyable {
    //a special non-generic object that incorporates different rules
}
