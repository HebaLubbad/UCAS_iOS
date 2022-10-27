import UIKit

// an array of integer type
var numbers : [Int] = [2, 4, 6, 8]

print("Array: \(numbers)")

//automatically identify the data type of an array based on its values.
var numbers2 = [2, 4, 6, 8]
print("Array: \(numbers2)")   // [2, 4, 6, 8]

//empty array
var value = [Int]()
print(value)


//Access Array Elements

var languages = ["Swift", "Java", "C++"]

// access element at index 0
print(languages[0])   // Swift

// access element at index 2
print(languages[2])   // C++

//Add Elements to an Array
//using apppedn
var nums = [21, 34, 54, 12]

print("Before Append: \(nums)")

// using append method
nums.append(32)

print("After Append: \(nums)")



//Example append

var primeNumbers = [2, 3, 5]
print("Array1: \(primeNumbers)")

var evenNumbers = [4, 6, 8]
print("Array2: \(evenNumbers)")

// join two arrays
primeNumbers.append(contentsOf: evenNumbers)

print("Array after append: \(primeNumbers)")



//using insert

var numbs = [21, 34, 54, 12]

print("Before Insert: \(numbs)")

numbs.insert(32, at: 1)

print("After insert: \(numbs)")


//Modify the Elements of an Array
var dailyActivities = ["Eat","Repeat"]
print("Initial Array: \(dailyActivities)")

// change element at index 1
dailyActivities[1] = "Sleep"

print("Updated Array:  \(dailyActivities)")

//Remove an Element from an Array
var langs = ["Swift","Java","Python"]

print("Initial Array: \(langs)")

// remove element at index 1
let removedValue = langs.remove(at: 1)

print("Updated Array: \(langs)")
print("Removed value: \(removedValue)")


//sort()    sorts array elements
//shuffle()    changes the order of array elements
//forEach()    calls a function for each element
//contains()    searches for the element in an array
//swapAt()    exchanges the position of array elements
//reverse()    reverses the order of array elements

//Looping Through Array
// an array of fruits
let fruits = ["Apple", "Peach", "Mango"]

// for loop to iterate over array
for fruit in fruits {
  print(fruit)
}

//Find Number of Array Elements
let evenNums = [2,4,6,8]
print("Array: \(evenNums)")

// find number of elements
print("Total Elements: \(evenNums.count)")


//Check if an Array is Empty
    // array with elements
    let nums2 = [21, 33, 59, 17]
    print("Numbers: \(nums2)")

    // check if numbers is empty
    var  result = nums2.isEmpty
    print("Is numbers empty? : \(nums2)")

    // array without elements
    let evenNumbs = [Int]()
    print("Even Numbers: \(evenNumbs)")

    // check if evenNumbers is empty
    result = evenNumbs.isEmpty
    print("Is evenNumbers empty? : \(result)")

//Array With Mixed Data Types
// array with String and integer data
var address: [Any] = ["Scranton", 570]
 
print(address)


//Set

//Creation

// create a set of integer type
var studentID : Set = [112, 114, 116, 118, 115]

print("Student ID: \(studentID)")

var studentIDs : Set<Int> = [112, 114, 115, 116, 118]

//add

var employeeID: Set = [21, 34, 54, 12]

print("Initial Set: \(employeeID)")

// using insert method
employeeID.insert(32)

print("Updated Set: \(numbers)")


    //Remove an Element from a Set


var languagesSet: Set = ["Swift", "Java", "Python"]

print("Initial Set: \(languagesSet)")

// remove Java from a set
let removedValueSet = languagesSet.remove("Java")

print("Set after remove(): \(languagesSet)")
languagesSet.contains("Java")
print("Set after remove(): \(languagesSet.contains("Java"))")

//
//sorted()    sorts set elements
//forEach()    performs the specified actions on each element
//contains()    searches the specified element in a set
//randomElement()    returns a random element from the set
//firstIndex()    returns the index of the given element


//Dictionary
var capitalCity = ["Nepal": "Kathmandu", "Italy": "Rome", "England": "London"]
print(capitalCity)

// dictionary with keys and values of different data types
var numbersDic = [1: "One", 2: "Two", 3: "Three"]
print(numbersDic)

var emptyDictionary =  [Int: String]()
print("Empty Dictionary: ",emptyDictionary)



print("Initial Dictionary: ",capitalCity)

capitalCity["Japan"] = "Tokyo"

print("Updated Dictionary: ",capitalCity)
print(capitalCity["Japan"] ?? "")

//Change Value of Dictionary
var studentIDDic = [111: "Eric", 112: "Kyle", 113: "Butters"]
print("Initial Dictionary: ", studentIDDic)

studentIDDic[112] = "Stan"

print("Updated Dictionary: ", studentIDDic)


//Access Elements from Dictionary

//Only keys
var cities = ["Nepal":"Kathmandu", "China":"Beijing", "Japan":"Tokyo"]

print("Dictionary: ", cities)

// cities.keys return all keys of cities
var countryName  = Array(cities.keys)

print("Keys: ", countryName)

///Access Values Only


print("Dictionary: ", cities)

// cities.values return all values of cities
var countryName2  = Array(cities.values)

print("Values: ", countryName2)

//Remove


print("Initial Dictionary: ", studentIDDic)

var removedValueDic  = studentIDDic.removeValue(forKey: 112)

print("Dictionary After removeValue(): ", removedValueDic)


//sorted()    sorts dictionary elements
//shuffled()    changes the order of dictionary elements
//contains()    checks if the specified element is present
//randomElement()    returns a random element from the dictionary
//firstIndex()    returns the index of the specified element


//Iterate Over a Dictionary


var classification = ["Fruit": "Apple", "Vegetable": "Broccoli", "Beverage": "Milk"]

print("Keys: Values")

for (key,value) in classification {
  print("\(key): \(value)")
}



//Tuples

// create tuple with two elements
var product = ("MacBook", 1099.99)

// access tuple elements
print("Name:", product.0)
print("Price:", product.1)


// modify second value
product.1 = 1299.99

print("\nTuple After Modification: ")

// access tuple elements
print("Name:", product.0)
print("Price:", product.1)


//Namrd Tuples
var company = (product: "Programiz App", version: 2.1)
// access tuple element using name
print("Product:", company.product)
print("Version:", company.version)


//We cannot add or remove elements from a tuple in Swift. For example,
//company.2 = "Google"
//
//company.remove("Apple")
//
//print(company)
