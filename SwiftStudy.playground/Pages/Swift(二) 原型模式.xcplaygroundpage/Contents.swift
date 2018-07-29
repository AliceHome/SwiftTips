//: [Previous](@previous)

import Foundation

//: 原型模式

class Person: NSObject, NSCopying {
    
    var name: String?
    func copy(with zone: NSZone? = nil) -> Any {
        let personType = type(of: self)
        let newP = personType.init()
        newP.name = name
        return newP
    }
    required override init() {
    }
}

let p = Person()
let p2 = p.copy() as! Person
if let name = p2.name  {
    print(name)
}


class Dog: NSCopying {
    
    var name: String?
    var ower: Person?
    
    func copy(with zone: NSZone? = nil) -> Any {
        let dynamicType = type(of: self)
        let copyDog = dynamicType.init()
        copyDog.name = name
        copyDog.ower = ower
        return copyDog
    }
    required init() {
        
    }
}

let dog = Dog()
dog.name = "Tom"
let newDog = dog.copy() as! Dog
dog.name


class TianYuanDog: Dog {
    
    var idNumber: Int?
    
    required init() {}
    
    init(number idNumber: Int) {
        self.idNumber = idNumber
    }
    
    override func copy(with zone: NSZone?) -> Any {
        let newCopy =  super.copy(with: zone) as! TianYuanDog
        newCopy.idNumber = self.idNumber
        return newCopy
    }
}

let tianyuan = TianYuanDog(number:123)
tianyuan.name = "中华田园犬"
let newCopy = tianyuan.copy(with: nil) as! TianYuanDog
newCopy.name
newCopy.idNumber



//: [Next](@next)
