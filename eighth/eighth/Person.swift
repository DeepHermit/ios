//
//  Person.swift
//  eighth
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import Foundation

enum Gender{
    case male
    case female
}
class Person:CustomStringConvertible{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName+lastName
        }
        
    }
    init(){
        self.firstName = ""
        self.lastName = ""
        self.age = 0
        self.gender = Gender.male
    }
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
        
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:18,gender:Gender.male)
    }
    var description:String{
        return "Name\(fullName) Age\(age) Gender\(gender)"
    }
}
//两个Person实例对象可以用==和!=进行比较,重载==和!=
func ==(a:Person,b:Person)->Bool{
    return a.fullName == b.fullName&&a.age == b.age&&a.gender == b.gender
}
func !=(a:Person,b:Person)->Bool{
    return a.fullName != b.fullName || a.age != b.age || a.gender != b.gender
}
