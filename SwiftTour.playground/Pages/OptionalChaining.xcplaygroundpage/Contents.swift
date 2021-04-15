// 可选链
// 可选链调用是一种可以在当前值可能为 nil 的可选值上请求和调用属性、方法及下标的方法

// 使用可选链式调用代替强制解包
class Residence {
    var numberOfRooms = 1
}
class Person {
    var residence: Residence?
}

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms.")
} else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) rooms.")
} else {
    print("Unable to retrieve the number of rooms.")
}

// 为可选链式调用定义模型类
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else {
            return nil
        }
    }
}

class AnotherResidence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}

// 通过可选链式调用访问属性
class AnotherPerson {
    var residence: AnotherResidence?
}
let angus = AnotherPerson()

angus.residence?.address

// 通过可选链式调用访问方法
angus.residence?.printNumberOfRooms()

// 通过可选链式调用访问下标
angus.residence?[0].name

// 访问可选类型的下标
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
print(testScores)

// 连接多层可选链式调用
if let angusStreet = angus.residence?.address?.street {
    print("Angus's street name is \(angusStreet)")
} else {
    print("Unable to retrieve the address")
}

// 在方法的可选返回值上进行可选链式调用
if let buildingIdentifier = angus.residence?.address?.buildingIdentifier() {
    print("Angus's building identifier is \(buildingIdentifier)")
}

if let beginsWithThe = angus.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("Angus's building identifier begins width \"The\".")
    } else {
        print("Angus's building identifier does not begin with\"The\"")
    }
}
