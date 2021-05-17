// 高级运算符
prefix operator +++
infix operator +-: AdditionPrecedence

// 位运算符

// Bitwise NOT Operator（按位取反运算符）
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

// Bitwise AND Operator（按位与运算符）
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8 = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

// Bitwise OR Operator（按位或运算符）
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedBits = someBits | moreBits

// Bitwise XOR Operator（按位异或运算符）
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

// Bitwise Left and Right Shift Operators（按位左移、右移运算符）
let shiftBits: UInt8 = 4
shiftBits << 1
shiftBits << 2
shiftBits << 5
shiftBits << 6
shiftBits >> 2

// 溢出运算符
var unsignedOverflow = UInt8.max
unsignedOverflow = unsignedOverflow &+ 1

var unsignedOverflower = UInt8.min
unsignedOverflower = unsignedOverflower &- 1

// 运算符函数
struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func +(left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector

// 前缀和后缀运算符
// 要实现前缀和后缀运算符，需要再声明运算函数的时候在 func 关键词之前指定 prefix 或者 postfix
extension Vector2D {
    static prefix func -(vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
let alsoPositive = -negative

// 复合赋值运算符
// 需要把运算符的左参数设置为 inout 类型
extension Vector2D {
    static func +=(left: inout Vector2D, right: Vector2D){
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

// 等价运算符
// 通常被称为相等运算符和不等运算符，需要增加 Equatable 协议的遵循
extension Vector2D: Equatable {
    static func ==(left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

// 自定义运算符
// 新的运算符要使用 operator 关键字在全局作用域内定义，还要指定 prefix、infix 或者 postfix 修饰符

extension Vector2D {
    static prefix func +++(vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

// 自定义中缀运算符的优先级
extension Vector2D {
    static func +-(left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let fistVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = fistVector +- secondVector
