// 基础部分

// 常量和变量
let max = 10
var current = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String
welcomeMessage = "Hello"

var red, green, blue: Double

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bounjour!"

let languageName = "Swift"
//languageName = "Swift++"

print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")

// 注释
// 这是一个注释
/* 这也是一个注释
 但是是多行的*/

// 分号
let cat = "🐱"; print(cat)

// 整数
let minValue = UInt8.min
let maxValue = UInt8.max
let minIntValue = Int.min
let maxIntValue = Int.max

// 浮点数
let floatValue: Float = 1.21
let doubleValue: Double = 1.22

// 类型安全和类型推断
let meaningOfLife = 42
let pi = 3.1415926
let anotherPi = 3 + 0.1415926

// 数值型字面量
let decimalInteger = 17
let binaryInteger = 0b10001 // 二进制
let octalInteger = 0o21 // 八进制
let hexadecimalInteger = 0x11 // 十六进制

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// 数值型类型转换
//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pii = Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pii)

// 类型别名
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

// 布尔值
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible")
}

let i = 1
//if i {}
if i == 1 {}

// 元组
let http404Error = (404, "NotFound")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")

print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")

// 可选类型
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveryAnswer: String?

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}

if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString

let optionalString = assumedString

if assumedString != nil {
    print(assumedString!)
}

if let definiteSting = assumedString {
    print(definiteSting)
}

// 错误处理
func canThrowAnError() throws {}

do {
    try canThrowAnError()
    // 没有错误消息抛出
} catch {
    // 有一个错误消息抛出
}
