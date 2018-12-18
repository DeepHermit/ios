//
//  Student.swift
//  eighth
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 xuelian. All rights reserved.
//


import Foundation

class Student:Person{
    var stuNo:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String){
        self.stuNo = stuNo
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    override var description:String{
        return "Name\(fullName) Age\(age) Gender\(gender) stuNo\(stuNo)"
    }
}

