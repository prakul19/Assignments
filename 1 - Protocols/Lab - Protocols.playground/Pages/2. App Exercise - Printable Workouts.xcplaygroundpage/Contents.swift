/*:
## App Exercise - Printable Workouts

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 The `Workout` objects you have created so far in app exercises don't show a whole lot of useful information when printed to the console. They also aren't very easy to compare or sort. Throughout these exercises, you'll make the `Workout` class below adopt certain protocols that will solve these issues.
 */
//class Workout: CustomStringConvertible {
//    var distance: Double
//    var time: Double
//    var identifier: Int
//
//    init(distance: Double, time: Double, identifier: Int) {
//        self.distance = distance
//        self.time = time
//        self.identifier = identifier
//    }
//
//    var description: String {
//        let distanceInMiles = distance * 2
//        let pace = time / distance
//        let paceInMinutesPerMile = pace / 60.0
//        return "Workout ID: \(identifier), Distance: \(distanceInMiles) miles, Pace: \(paceInMinutesPerMile) minutes/mile"
//    }
//}
//
//let workout = Workout(distance: 5.0, time: 30.0, identifier: 1)
//print(workout)
//:  Make the `Workout` class above conform to the `CustomStringConvertible` protocol so that printing an instance of `Workout` will provide useful information in the console. Create an instance of `Workout`, give it an identifier of 1, and print it to the console.
//class Workout: CustomStringConvertible {
//    var distance: Double
//    var time: Double
//    var identifier: Int
//
//    init(distance: Double, time: Double, identifier: Int) {
//        self.distance = distance
//        self.time = time
//        self.identifier = identifier
//    }
//
//    var description: String {
//        let distanceInMiles = distance * 2
//        let pace = time / distance
//        let paceInMinutesPerMile = pace / 60.0
//        return "Workout ID: \(identifier), Distance: \(distanceInMiles) miles, Pace: \(paceInMinutesPerMile) minutes/mile"
//    }
//}
//
//let workout = Workout(distance: 5.0, time: 30.0, identifier: 1)
//print(workout)

//:  Make the `Workout` class above conform to the `Equatable` protocol. Two `Workout` objects should be considered equal if they have the same identifier. Create another instance of `Workout`, giving it an identifier of 2, and print a boolean expression that evaluates to whether or not it is equal to the first `Workout` instance you created.
//class Workout: CustomStringConvertible, Equatable {
//    var distance: Double
//    var time: Double
//    var identifier: Int
//
//    init(distance: Double, time: Double, identifier: Int) {
//        self.distance = distance
//        self.time = time
//        self.identifier = identifier
//    }
//
//    var description: String {
//        let distanceInMiles = distance * 2
//        let pace = time / distance
//        let paceInMinutesPerMile = pace / 60.0
//        return "Workout ID: \(identifier), Distance: \(distanceInMiles) miles, Pace: \(paceInMinutesPerMile) minutes/mile"
//    }
//
//    static func == (lhs: Workout, rhs: Workout) -> Bool {
//        return lhs.identifier == rhs.identifier
//    }
//}
//
//let workout1 = Workout(distance: 5.0, time: 30.0, identifier: 1)
//let workout2 = Workout(distance: 6.0, time: 36.0, identifier: 2)
//
//print(workout1 == workout2)

/*:
 Make the `Workout` class above conform to the `Comparable` protocol so that you can easily sort multiple instances of `Workout`. `Workout` objects should be sorted based on their identifier. 
 
 Create three more `Workout` objects, giving them identifiers of 3, 4, and 5, respectively. Then create an array called `workouts` of type `[Workout]` and assign it an array literal with all five `Workout` objects you have created. Place these objects in the array out of order. Then create another array called `sortedWorkouts` of type `[Workout]` that is the `workouts` array sorted by identifier. 
 */
//class Workout: CustomStringConvertible, Comparable {
//    var distance: Double
//    var time: Double
//    var identifier: Int
//
//    init(distance: Double, time: Double, identifier: Int) {
//        self.distance = distance
//        self.time = time
//        self.identifier = identifier
//    }
//
//    var description: String {
//        let distanceInMiles = distance * 2
//        let pace = time / distance
//        let paceInMinutesPerMile = pace / 60.0
//        return "Workout ID: \(identifier), Distance: \(distanceInMiles) miles, Pace: \(paceInMinutesPerMile) minutes/mile"
//    }
//
//    static func == (lhs: Workout, rhs: Workout) -> Bool {
//        return lhs.identifier == rhs.identifier
//    }
//
//    static func < (lhs: Workout, rhs: Workout) -> Bool {
//        return lhs.identifier < rhs.identifier
//    }
//
//    static func > (lhs: Workout, rhs: Workout) -> Bool {
//        return lhs.identifier > rhs.identifier
//    }
//}
//
//let workout1 = Workout(distance: 5.0, time: 30.0, identifier: 1)
//let workout2 = Workout(distance: 6.0, time: 36.0, identifier: 2)
//let workout3 = Workout(distance: 3.0, time: 18.0, identifier: 3)
//let workout4 = Workout(distance: 4.0, time: 24.0, identifier: 4)
//let workout5 = Workout(distance: 7.0, time: 42.0, identifier: 5)
//
//let workouts = [workout5, workout1, workout3, workout4, workout2]
//let sortedWorkouts = workouts.sorted()
//
//print(sortedWorkouts)
//:  Make `Workout` adopt the `Codable` protocol so you can easily encode `Workout` objects as data that can be stored between app launches. Use a `JSONEncoder` to encode one of your `Workout` instances. Then use the encoded data to initialize a `String`, and print it to the console.
import Foundation

class Workout: CustomStringConvertible, Comparable, Codable {
    var distance: Double
    var time: Double
    var identifier: Int

    init(distance: Double, time: Double, identifier: Int) {
        self.distance = distance
        self.time = time
        self.identifier = identifier
    }

    var description: String {
        let distanceInMiles = distance * 2
        let pace = time / distance
        let paceInMinutesPerMile = pace / 60.0
        return "Workout ID: \(identifier), Distance: \(distanceInMiles) miles, Pace: \(paceInMinutesPerMile) minutes/mile"
    }

    static func == (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier == rhs.identifier
    }

    static func < (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier < rhs.identifier
    }

    static func > (lhs: Workout, rhs: Workout) -> Bool {
        return lhs.identifier > rhs.identifier
    }

    enum CodingKeys: String, CodingKey {
        case distance
        case time
        case identifier
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.distance = try container.decode(Double.self, forKey: .distance)
        self.time = try container.decode(Double.self, forKey: .time)
        self.identifier = try container.decode(Int.self, forKey: .identifier)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(distance, forKey: .distance)
        try container.encode(time, forKey: .time)
        try container.encode(identifier, forKey: .identifier)
    }
}

let workout = Workout(distance: 5.0, time: 30.0, identifier: 1)

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

if let encodedData = try? encoder.encode(workout) {
    if let encodedString = String(data: encodedData, encoding: .utf8) {
        print(encodedString)
    }
}

/*:
[Previous](@previous)  |  page 2 of 5  |  [Next: Exercise - Create a Protocol](@next)
 */
