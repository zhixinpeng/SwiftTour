// 字符串和字符
import Foundation
// 字符串字面量
let someString = "Some string literal value"

let quotation = """
The White Rabbit put on his spectacles.
"Begin at the beginning," the King said gravely
"""

let softWrappedQuotation = """
The White. "Where shall I begin, \
please your Majesty?" he asked.
"""

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""


let threeMoreDoubleQuotationMarks = #"""
Here are three more double quotes: """
"""#

// 初始化空字符串
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}

// 字符串可变性
var variableString = "Horse"
variableString += " and carriage"

// 使用字符
for character in "Dog!" {
    print(character)
}

let catCharacters: [Character] = ["C", "a", "t", "!"]
let catString = String(catCharacters)
print(catString)

// 连接字符串和字符
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

let exclamationMark: Character = "!"
welcome.append(exclamationMark)

// 字符串插值
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

// 计算字符数量
var world = "cafe"
print("the number of characters in \(world) is \(world.count)")

// 访问和修改字符串
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//greeting[greeting.endIndex] // error

for index in greeting.indices {
    print("\(greeting[index]) ", terminator: "")
}

var wel = "hello"
wel.insert("1", at: wel.endIndex)
wel.insert(contentsOf: " there", at: wel.index(before: wel.endIndex))
wel.remove(at: wel.index(before: wel.endIndex))

let range = wel.index(wel.endIndex, offsetBy: -6)..<wel.endIndex
wel.removeSubrange(range)

// 子字符串
let greet = "Hello, world!"
let ind = greet.firstIndex(of: ",") ?? greet.endIndex
let beginning = greet[..<ind]
let newString = String(beginning)

// 比较字符串
let q = "you and I"
let s = "you and I"
if q == s {
    print("These two strings are considered equal")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
