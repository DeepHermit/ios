//: Playground - noun: a place where people can play
import UIKit
//第1题
let dictionary:[[String:Any]] = [["age":29,"name":"xiaoming"],["age":24,"name":"xiaofang"]]
let age = dictionary.map({$0["age"]})
print(age)
//第2题
func filter(str:[String]) -> [String]{
    var str2:[String] = [String]()
    for str3 in str{
        if Int(str3) != nil {
            str2.append(str3)
        }
        
    }
    return str2
}
var str2 = [ "aaaaa","ppppp","ppppp","lllll","eeeee","ooooo"]
let transfer = filter(str:str2)
print(transfer)
//第3题
let array = ["one","two","three","four"]
let connectarray = array.reduce(""){
    connectarray,letter in "\(connectarray),\(letter)"
}
print(connectarray)
//第4题
let arr = [16,28,93,10,2]
let temp = arr.reduce((max:Int.min,min:Int.max,sum:0)){
    (temp,i) in return(max(temp.max,i),min(temp.min,i),temp.sum+i)
}
print("max:\(temp.max)")
print("min:\(temp.min)")
print("sum:\(temp.sum)")
//第5题
var arrfunc = [Any]()
func f1(x1: String) -> String {
    return x1
}
func f2(x2: Int) -> Int {
    return x2
}
func f3(x3: Double, x4:Double) -> Int{
    return 4
}
func f4(x5: Int) -> Int{
    return x5
}
arrfunc.append(f1)
arrfunc.append(f2)
arrfunc.append(f3)
arrfunc.append(f4)
var j = 1
for i in arrfunc{
    if i is ((Int)->Int){
        print("func f\(j) is:(Int) -> Int")
    }
    j = j + 1
}
//第6题
extension Int{
    func sqrt(number:Int)->Double{
        return Darwin.sqrt(Double(number))
    }
}
print(sqrt(81))
//第7题
func MaxandMin<T:Comparable>(data: [T]) -> (max:T,min:T){
    var max = data[0]
    var min = data[0]
    for i in data{
        if max < i{
            max = i
        }else if min > i{
            min = i
        }
    }
    return (max,min)
}
let intapp = MaxandMin(data:[35,49,92,32,47,10])
print("max : \(intapp.max) ,  min : \(intapp.min)")

let doubleapp = MaxandMin(data:[28.0,28.1,28.2,28.3,73.9])
print("max : \(doubleapp.max) ,  min : \(doubleapp.min)")

let charapp = MaxandMin(data:["abc","bbb","acc","dad","ebe"])
print("max : \(charapp.max) ,  min : \(charapp.min)")


