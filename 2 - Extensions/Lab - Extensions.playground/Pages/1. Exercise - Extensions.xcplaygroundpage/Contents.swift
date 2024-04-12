/*:
## Exercise - Extensions
 
 Define an extension to `Character` that includes a function `isVowel()`. The function returns `true` if the character is a vowel (a,e,i,o,u), and `false` otherwise. Be sure to properly handle uppercase and lowercase characters.
 */
//extension Character {
//    func isVowel() -> Bool {
//        let lowercasedCharacter = self.lowercased()
//        return lowercasedCharacter == "a" || lowercasedCharacter == "e" || lowercasedCharacter == "i" || lowercasedCharacter == "o" || lowercasedCharacter == "u"
//    }
//}
//
//print("a".isVowel())
//print("A".isVowel())
//print("b".isVowel())


//:  Create two `Character` constants, `myVowel` and `myConsonant`, and set them to a vowel and a consonant, respectively. Use the `isVowel()` methods on each constant to determine whether or not it's a vowel.
extension Character {
    func isVowel() -> Bool {
        let lowercasedCharacter = self.lowercased()
        return lowercasedCharacter == "a" || lowercasedCharacter == "e" || lowercasedCharacter == "i" || lowercasedCharacter == "o" || lowercasedCharacter == "u"
    }
}

let myVowel: Character = "A"
let myConsonant: Character = "B"

if myVowel.isVowel() {
    print("\(myVowel) is a vowel.")
} else {
    print("\(myVowel) is not a vowel.")
}

if myConsonant.isVowel() {
    print("\(myConsonant) is a vowel.")
} else {
    print("\(myConsonant) is not a vowel.")
}


//:  Create a `Rectangle` struct with two variable properties, `length` and `width`, both of type `Double`. Below the definition, write an extension to `Rectangle` that includes a function, `halved()`. This function returns a new `Rectangle` instance with half the length and half the width of the original rectangle.
//
//struct Rectangle {
//    var length: Double
//    var width: Double
//}
//
//extension Rectangle {
//    func halved() -> Rectangle {
//        return Rectangle(length: length / 2, width: width / 2)
//    }
//}
//
//let originalRectangle = Rectangle(length: 10.0, width: 6.0)
//let halvedRectangle = originalRectangle.halved()
//print("Original Rectangle: \(originalRectangle)")
//print("Halved Rectangle: \(halvedRectangle)")
//

/*:
 Within the existing `Rectangle` extension, add a new mutating function, `half()`, which updates the original rectangle to have half the length and half the width. Use the `halved()` function as part of the implementation for `half()`.
 
 Below, create a variable `Rectangle` called `myRectangle`, and set its length to 10 and its width to 5. Create a second instance, `mySmallerRectangle`, that's the result of calling `halved()` on `myRectangle`. Then update the values of `myRectangle` by calling `half()` on itself. Print each of the instances.
 */

struct Rectangle {
    var length: Double
    var width: Double
}

extension Rectangle {
    func halved() -> Rectangle {
        return Rectangle(length: length / 2, width: width / 2)
    }
    
    mutating func half() {
        let halvedRect = self.halved()
        self.length = halvedRect.length
        self.width = halvedRect.width
    }
}

var myRectangle = Rectangle(length: 10, width: 5)

let mySmallerRectangle = myRectangle.halved()

myRectangle.half()

print("Original Rectangle: \(myRectangle)")
print("Halved Rectangle: \(mySmallerRectangle)")


/*:
page 1 of 2  |  [Next: App Exercise - Workout Extensions](@next)
 */
