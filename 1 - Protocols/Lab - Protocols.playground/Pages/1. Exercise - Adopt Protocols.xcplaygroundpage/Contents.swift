/*:
## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
//class Human {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}
//
//let person1 = Human(name: "Ana", age: 19)
//let person2 = Human(name: "Prakul", age: 19)
//:  Make the `Human` class adopt the `CustomStringConvertible` protocol. Print both of your previously initialized `Human` objects.
//class Human: CustomStringConvertible {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    var description: String {
//        return "Name: \(name), Age: \(age)"
//    }
//}
//
//let person1 = Human(name: "Ana", age: 19)
//let person2 = Human(name: "Prakul", age: 19)
//
//print(person1)
//print(person2)

//:  Make the `Human` class adopt the `Equatable` protocol. Two instances of `Human` should be considered equal if their names and ages are identical to one another. Print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are equal to eachother (using `==`). Then print the result of a boolean expression evaluating whether or not your two previously initialized `Human` objects are not equal to eachother (using `!=`).
//class Human: CustomStringConvertible, Equatable {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    var description: String {
//        return "Name: \(name), Age: \(age)"
//    }
//
//    static func == (lhs: Human, rhs: Human) -> Bool {
//        return lhs.name == rhs.name && lhs.age == rhs.age
//    }
//}
//
//let person1 = Human(name: "Ana", age: 19)
//let person2 = Human(name: "Prakul", age: 19)
//let person3 = Human(name: "Parth", age: 21)
//
//print(person1 == person3)
//print(person1 != person2)

//:  Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
//class Human: CustomStringConvertible, Comparable {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//
//    var description: String {
//        return "Name: \(name), Age: \(age)"
//    }
//
//    static func == (lhs: Human, rhs: Human) -> Bool {
//        return lhs.name == rhs.name && lhs.age == rhs.age
//    }
//
//    static func < (lhs: Human, rhs: Human) -> Bool {
//        return lhs.age < rhs.age
//    }
//
//    static func > (lhs: Human, rhs: Human) -> Bool {
//        return lhs.age > rhs.age
//    }
//}
//
//let person1 = Human(name: "Ana", age: 20)
//let person2 = Human(name: "Prakul", age: 19)
//let person3 = Human(name: "Parth", age: 21)
//let person4 = Human(name: "Parag", age: 22)
//let person5 = Human(name: "Shreya", age: 18)
//
//let people = [person1, person2, person3, person4, person5]
//let sortedPeople = people.sorted { $0 < $1 }
//
//print(sortedPeople)

//:  Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
import Foundation

class Human: Codable {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    enum CodingKeys: String, CodingKey {
        case name
        case age
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
    }
}

let person = Human(name: "Ana", age: 19)

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

if let data = try? encoder.encode(person) {
    if let jsonString = String(data: data, encoding: .utf8) {
        print(jsonString)
    }
}

/*:
page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
 */
