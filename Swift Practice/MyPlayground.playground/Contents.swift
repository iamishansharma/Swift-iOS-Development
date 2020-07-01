// This is a single line comment

/*This is a multi
 line comment*/

print("Hello World")

// If you want to comment a line, place cursor anywhere on the line and then click ( cmd + / )

print("Hello \(2+3) World")

// This is how to insert variable arithematic inside strings

print("The result of 5 + 3 = \(5+3)")

// use 'let' if you want to declare a constant variable else use 'var'

// This is close range which gives random number between 1 and 10 both inclusive
print(Int.random(in: 1 ... 10))

print(Int.random(in: 1 ..< 10)) // 1 to 9

// Gets random element from array -> // arrayName.randomElement()

// Shuffles the array -> array.shuffle

// string concatenation
let password = "a" + "b"
print(password);
