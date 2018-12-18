import UIKit
var str = "Hello, playground"
enum Gender:Int{
    case male
    case female
    static func >(Ihs:Gender,rhs:Gender)->Bool{
        return Ihs.rawValue < rhs.rawValue
    }
}
class Person{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName+""+lastName
        }
    }
    static func == (p1:Person,p2:Person)->Bool {
        return p1.firstName == p2.firstName
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.female)
    }
    var description:String{
        return "Name:\(fullName)    Age:\(age)    Gender:\(gender)  "
    }
}

class Student:Person{
    var stuNo:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String){
        self.stuNo = stuNo
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.male,stuNo:"20161104")
    }
    override var description:String{
        return super.description + "  stuNo:\(stuNo)"
    }
}

class Teacher:Person{
    var title:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,title:String){
        self.title = title
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:36,gender:Gender.male,title:"math")
    }
    override var description:String{
        return super.description + "  title:\(title)"
    }
}
let p1 = Person(firstName:"老",lastName:"大",age:36,gender:Gender.male)
let p2 = Person(name:"hekk")
print(p1.description)
print(p2.description)
let s1 = Student(firstName:"老",lastName:"二",age:19,gender:Gender.male,stuNo:"201")
let s2 = Student(name:"xiaoliu")
print(s1.description)
print(s2.description)
let t1 = Teacher(firstName:"老",lastName:"三",age:32,gender:Gender.male,title:"math")
let t2 = Teacher(name:"liuwu")
print(t1.description)
print(t2.description)
let p3 = p1
if p1 == p3 {
    print("is the same people")
}else{
    print("is not the same people")
}
var people = [Person]()
people.append(p1)
people.append(p2)
people.append(s1)

for i in 1...3 {
    let p = Person(firstName: "钱", lastName: "\(i)", age: 30, gender:Gender.male)
    people.append(p)
}
for i in 1...3 {
    let s = Student(firstName:"孙",lastName: "\(i)",age:18,gender:Gender.female,stuNo:"20160100\(i)")
    people.append(s)
}
for i in 1...3 {
    let t = Teacher(firstName:"李",lastName:"\(i)",age:20,gender:Gender.male,title:"数学")
    people.append(t)
}
print(people)
var dictionary = ["Person":0,"Student":0,"Teacher":0]
for item in people {
    if item is Student {
        dictionary["Teacher"]! += 1
    }else if item is Teacher {
        dictionary["Student"]! += 1
    }else{
        dictionary["Person"]! += 1
    }
}
for (key,value) in dictionary {
    print("\(key) has \(value) items")
}

for item in people{
    print(item.description)
}
people.sort{
    return $0.age < $1.age
}
for item in people {
    print(item.description)
}
people.sort{
    return $0.fullName < $1.fullName
}
for item in people {
    print(item.description)
}
people.sort{
    return ($0.gender > $1.gender) && ($0.age > $1.age)
}
for item in people {
    print(item.description)
}


