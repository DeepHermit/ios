//
//  ViewController.swift
//  eighth
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var information: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    
    var persons = [Person]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let t1=Teacher(firstName:"lao",lastName:"shi",age:27,gender:Gender.male,title:"Chinese")
        let t2=Teacher(firstName:"jiao",lastName:"shi",age:26,gender:Gender.female,title:"English")
        let t3=Teacher(firstName:"jiao",lastName:"shou",age:26,gender:Gender.female,title:"Math")
        let s1=Student(firstName:"xue",lastName:"sheng",age:18,gender:Gender.female,stuNo:"0121")
        let s2=Student(firstName:"xue",lastName:"zhe",age:16,gender:Gender.male,stuNo:"0122")
        let s3=Student(firstName:"ru",lastName:"sheng",age:17,gender:Gender.female,stuNo:"0123")
        persons.append(s1)
        persons.append(s2)
        persons.append(s3)
        persons.append(t1)
        persons.append(t2)
        persons.append(t3)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let stu = persons[indexPath.row] as? Student {
            var cell:StudentTableViewCell!
            cell = tableView.dequeueReusableCell(withIdentifier: "studentcell",for: indexPath) as? StudentTableViewCell
            cell.name.text = stu.fullName
            cell.age.text = "\(stu.age)"
            cell.stuNo.text = "\(stu.stuNo)"
            cell.gender.text = "\(stu.gender)"
            cell.pic.image = UIImage(named: "student")
            return cell
        } else {
            let tea = persons[indexPath.row] as! Teacher
            var cell:TeacherTableViewCell!
            cell = tableView.dequeueReusableCell(withIdentifier: "teachercell", for: indexPath) as? TeacherTableViewCell
            cell.name.text = tea.fullName
            cell.age.text = "\(tea.age)"
            cell.title.text = "\(tea.title)"
            cell.gender.text = "\(tea.gender)"
            cell.pic.image = UIImage(named: "teacher")
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        information.text = "you choose :\(indexPath.row)"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            persons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        let per = persons.remove(at: sourceIndexPath.row)
        persons.insert(per, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    @IBAction func add(_ sender: Any) {
        if let name = input.text,let row = tableView.indexPathForSelectedRow?.row{
            if persons[row] is Student{
                let stu = Student(firstName:name,lastName:"",age:18,gender:Gender.female,stuNo:"0126")
                persons.append(stu)
            }else{
                let tea = Teacher(firstName:name,lastName:"",age:18,gender:Gender.female,title:"weizhi")
                persons.append(tea)
            }
            tableView.reloadData()
            input.resignFirstResponder()
        }
    }
    @IBAction func edit(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    @IBAction func del(_ sender: Any) {
        if let row = tableView.indexPathForSelectedRow?.row {
            persons.remove(at: row)
            tableView.reloadData()
        }
    }
    //    func edit(_ sender: Any) {
//        tableView.isEditing = !tableView.isEditing
//    }
//    func del(_ sender: Any) {
//        if let row = tableView.indexPathForSelectedRow?.row {
//            persons.remove(at: row)
//            tableView.reloadData()
//            input.resignFirstResponder()
//        }
//    }
}

