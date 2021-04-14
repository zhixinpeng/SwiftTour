// 闭包

// 闭包表达式
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 })

// 根据上下文推断类型
reversedNames = names.sorted(by: {s1, s2 in return s1 > s2})

// 单表达式闭包的隐式返回
reversedNames = names.sorted(by: {s1, s2 in s1 > s2})

// 参数名称缩写
reversedNames = names.sorted(by: { $0 > $1 })

// 运算符方法
reversedNames = names.sorted(by: >)

// 尾随闭包
reversedNames = names.sorted() { $0 > $1 }

// 如果闭包表达式是函数或方法的唯一参数，可以省略括号
reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

// 值捕获
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()

// 闭包是引用类型
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

// 逃逸闭包
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNoescapingClosure(closure: () -> Void){
    closure()
}
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            // 逃逸闭包必须显式的引用 self
            self.x = 100
        }
        someFunctionWithNoescapingClosure {
            x = 200
        }
    }
}
let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

// 自动闭包
// 自动闭包可以延迟求值，直到调用闭包，代码段才会被执行
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)

print("Now serving \(customerProvider())")
print(customersInLine.count)

func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) })

func anotherServe(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
anotherServe(customer: customersInLine.remove(at: 0))

// 自动闭包加逃逸闭包
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
