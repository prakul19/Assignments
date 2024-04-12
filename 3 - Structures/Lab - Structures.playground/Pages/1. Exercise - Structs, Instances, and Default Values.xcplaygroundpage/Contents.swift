/*:
## Exercise - Structs, Instances, and Default Values
 
 Imagine you are creating an app that will monitor location. Create a `GPS` struct with two variable properties, `latitude` and `longitude`, both with default values of 0.0.
 */
struct GPS {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double = 0.0, longitude: Double = 0.0) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

var currentLocation = GPS()
print("Current Location: Latitude \(currentLocation.latitude), Longitude \(currentLocation.longitude)")
//:  Create a variable instance of `GPS` called `somePlace`. It should be initialized without supplying any arguments. Print out the latitude and longitude of `somePlace`, which should be 0.0 for both.
var somePlace = GPS()
print("somePlace Location: Latitude \(somePlace.latitude), Longitude \(somePlace.longitude)")
//:  Now imagine you are making a social app for sharing your favorite books. Create a `Book` struct with four variable properties: `title`, `author`, `pages`, and `price`. The default values for both `title` and `author` should be an empty string. `pages` should default to 0, and `price` should default to 0.0.
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    init(title: String = "", author: String = "", pages: Int = 0, price: Double = 0.0) {
        self.title = title
        self.author = author
        self.pages = pages
        self.price = price
    }
}
let defaultBook = Book()

print("Default Book: Title: '\(defaultBook.title)', Author: '\(defaultBook.author)', Pages: \(defaultBook.pages), Price: $\(defaultBook.price)")

let harryPotter = Book(title: "Harry Potter and the Philosopher's Stone", author: "J.K. Rowling", pages: 223, price: 15.99)
print("Book: Title: '\(harryPotter.title)', Author: '\(harryPotter.author)', Pages: \(harryPotter.pages), Price: $\(harryPotter.price)")
//:  Create a variable instance of `Book` called `favoriteBook` without supplying any arguments. Print out the title of `favoriteBook`. Does it currently reflect the title of your favorite book? Probably not. Change all four properties of `favoriteBook` to reflect your favorite book. Then, using the properties of `favoriteBook`, print out facts about the book.
var favoriteBook = Book()
print("Title of favorite book before update: \(favoriteBook.title)")

favoriteBook.title = "To Kill a Mockingbird"
favoriteBook.author = "Harper Lee"
favoriteBook.pages = 324
favoriteBook.price = 9.99

print("Facts about my favorite book:")
print("Title: \(favoriteBook.title)")
print("Author: \(favoriteBook.author)")
print("Pages: \(favoriteBook.pages)")
print("Price: $\(favoriteBook.price)")


/*:
page 1 of 10  |  [Next: App Exercise - Workout Tracking](@next)
 */
