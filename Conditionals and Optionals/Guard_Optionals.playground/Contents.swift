import Cocoa


//Guard

// Example 1 with Looping
var x = 2

while (x <= 10) {
    
  // guard condition to check the even number
  guard x % 2 == 0 else {
   
     x = x + 1
    continue
  }

  print(x)
  x = x + 1
}

// Example 2 with Functions

// create a function
func checkOddEven() {
  var number = 23

  // use of guard statement
  guard number % 2 == 0 else {
    
    print("Odd Number")
    return
  }

  print("Even Number")
}

// function call
checkOddEven()

// Example 3 with Functions

func checkJobEligibility() {
    
  var age = 33

  guard age >= 18, age <= 40 else {
    print("Not Eligible for Job")
    return
  }

  print("You are eligible for this job")

}

checkJobEligibility()


///----------- Optionals -------------------------
 // Declaration
var someValue:Int?
var someAnotherValue:Int!
print(someValue)
print(someAnotherValue)

// Optional Assign value
let someNumber:Int? = 5
print(someNumber)
print(someNumber!)

// Force Optional
let someInt:Int! = 5
print(someInt)



//var unwrappedValue:Int = someValue //crashes due to this line


//Optional Handling
// If statment
var someValueWithIf:Int?
var someAnotherValueWithIf:Int! = 0
        
if someValueWithIf != nil {
    print("It has some value \(someValueWithIf!)")
} else {
    print("doesn't contain value")
}
        
if someAnotherValueWithIf != nil {
    print("It has some value \(someAnotherValueWithIf!)")
} else {
    print("doesn't contain value")
}

//Handling Optionals with if let
var someValueWithLet:Int?
var someAnotherValueWithLet:Int! = 0
       
if let temp = someValueWithLet {
    print("It has some value \(temp)")
} else {
    print("doesn't contain value")
}
        
if let temp = someAnotherValueWithLet {
    print("It has some value \(temp)")
} else {
    print("doesn't contain value")
}

//Handling Optionals with Guard
func testFunction() {
    let someValue:Int? = 5
    guard let temp = someValue else {
        return
    }
    print("It has some value \(temp)")
}

testFunction()

 //Handling Optionals with Value coalescing "Default value"
var someValuecoalescing:Int? = 10
let defaultValuecoalescing = 5
let unwrappedValue:Int = someValuecoalescing ?? defaultValuecoalescing
print(unwrappedValue)


var someValueNilcoalescing:Int!
let defaultValue = 5
let unwrappedValueNilcoalescing:Int = someValueNilcoalescing ?? defaultValue
print(unwrappedValueNilcoalescing)
