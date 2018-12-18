//
//  Teacher.swift
//  eighth
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import Foundation
class Teacher:Person{
    var title:String
    //构造函数
    init (firstName:String,lastName:String,age:Int,gender:Gender,title:String){
        self.title = title
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    //重写构造函数
    override init(){
        title=""
        super.init()
    }
    override var description:String{
        return "Name\(fullName) Age\(age) Gender\(gender) Title\(title)"
    }
    
}
