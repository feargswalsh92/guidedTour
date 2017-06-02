//: ## Enumerations and Structures
//:
//: Use `enum` to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.
//:
enum Rank: Int {
    case Ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
            case .Ace:
                return "ace"
            case .Jack:
                return "jack"
            case .Queen:
                return "queen"
            case .King:
                return "king"
            default:
                return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
let jack = Rank.Jack
let jackRawValue = jack.rawValue
let ten = Rank.ten
let tenRawValue = ten.rawValue

//this function will compare two raw values and determine if they are identical
func compareRawValues(rawValue1: Int,rawValue2: Int) -> Int{
    
    return rawValue2 - rawValue1

}

compareRawValues(rawValue1: aceRawValue, rawValue2: jackRawValue)
//: - Experiment:
//: Write a function that compares two `Rank` values by comparing their raw values.
//:
//: By default, Swift assigns the raw values starting at zero and incrementing by one each time, but you can change this behavior by explicitly specifying values. In the example above, `Ace` is explicitly given a raw value of `1`, and the rest of the raw values are assigned in order. You can also use strings or floating-point numbers as the raw type of an enumeration. Use the `rawValue` property to access the raw value of an enumeration case.
//:
//: Use the `init?(rawValue:)` initializer to make an instance of an enumeration from a raw value. It returns either the enumeration case matching the raw value or `nil` if there is no matching `Rank`.
//:
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

//: The case values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn’t a meaningful raw value, you don’t have to provide one.
//:
enum Suit: Int{
    
    case Spades = 1
    case Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
            case .Spades:
                return "spades"
            case .Hearts:
                return "hearts"
            case .Diamonds:
                return "diamonds"
            case .Clubs:
                return "clubs"
        }
    }
    func color(simpleDescription: String) -> String {
        switch simpleDescription {
            case "hearts":
                return "red"
            case "diamonds":
                return "red"
            default:
               return "black"
        
        }
//        switch rawValue {
//            case
        }
    }

let hearts = Suit.Hearts
//let heartsRawValue = hearts.rawValue
let heartsDescription = hearts.simpleDescription()
let colour = hearts.color(simpleDescription: "hearts")

//: - Experiment:
//: Add a `color()` method to `Suit` that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
//:
//: Notice the two ways that the `hearts` case of the enumeration is referred to above: When assigning a value to the `hearts` constant, the enumeration case `Suit.hearts` is referred to by its full name because the constant doesn’t have an explicit type specified. Inside the switch, the enumeration case is referred to by the abbreviated form `.hearts` because the value of `self` is already known to be a suit. You can use the abbreviated form anytime the value’s type is already known.
//:
//: If an enumeration has raw values, those values are determined as part of the declaration, which means every instance of a particular enumeration case always has the same raw value. Another choice for enumeration cases is to have values associated with the case—these values are determined when you make the instance, and they can be different for each instance of an enumeration case. You can think of the associated values as behaving like stored properties of the enumeration case instance. For example, consider the case of requesting the sunrise and sunset times from a server. The server either responds with the requested information, or it responds with a description of what went wrong.
//:
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case other(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let other = ServerResponse.other("Cheese being restocked in an hour")

switch failure {
    case let .result(sunrise, sunset):
        print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
    case let .failure(message):
        print("Failure...  \(message)")
    case let .other(message) :
    print("Sorry for the inconvenience \(message).")
}

//: - Experiment:
//: Add a third case to `ServerResponse` and to the switch.
//:
//: Notice how the sunrise and sunset times are extracted from the `ServerResponse` value as part of matching the value against the switch cases.
//:
//: Use `struct` to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.
//:
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
        
    }
    
    func buildDeck() -> [Card] {
        var n = 1
        var deck = [Card]()
        while let rank = Rank(rawValue: n) {
            var m = 1
            
            while let suit = Suit(rawValue: m) {
                deck.append(Card(rank: rank, suit: suit))
                m += 1
            }
            n += 1
            
        }
        return deck
    }
}
let aceOfSpades = Card(rank: .Ace, suit: .Spades)
let aceOfSpadesDescription = aceOfSpades.buildDeck()
//        for s in iterateEnum(Suit.self) {
//           print(s)
//            
//           return false
//        
//    }
//        return false
//    
//    
//}


let threeOfSpades = Card(rank: .three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//let aceOfSpadesBool = aceOfSpades.buildDeck(description: aceOfSpadesDescription)




//func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
//    var i = 0
//    return AnyIterator {
//        let next = withUnsafeBytes(of: &i) { $0.load(as: T.self) }
//        if next.hashValue != i { return nil }
//        i += 1
//        return next
//    }
//}
//


//if dir == .down { ... }
//
//let dirs: Set<Direction> = [.right, .left]
//
//print(Direction.up)
//
//debugPrint(Direction.up)



//let deck = buildDeck(aceOfSpades: Card)




//      //            case North, South, East, West
//        }
//        
//        var direction = CompassPoint.North
//        
//        direction = .South
//        
//        enum CollisionType: Int {
//            case Player = 1
//            case Enemy = 2
//        }
//        
//        let type = CollisionType.Player
//        if type == .Player {
//            print("i")
//        }
////
////        enum Student {
////            case Name(String)
////            ca
////        }
//





////let aceOfSpades = Card(rank: .ace, suit: .spades)
//let aceOfSpadesDescription = aceOfSpades.simpleDescription()

//let deckOfCardsStruct = deckCard.buildDeck(deckCard)

//let deckOfCardsInstance = Card(rank: Rank, suit: Suit)
//(rank: Rank, suit: Suit)

//: - Experiment:
//: Add a method to `Card` that creates a full deck of cards, with one card of each combination of rank and suit.
//:


//: [Previous](@previous) | [Next](@next)
