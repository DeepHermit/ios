//
//  ViewController.swift
//  twelvetwo
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSex: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func add(_ sender: Any) {
        let person = Person(context:context)
        person.name = tfName.text
        person.sex = tfSex.text
        person.age = tfAge.text
        person.phone = tfPhone.text
        //保存
        appDelegate.saveContext()
    }
    
    @IBAction func update(_ sender: Any) {
        //先构造一个请求对象
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            p.phone = tfPhone.text
            p.sex = tfSex.text
            p.age = tfAge.text
            //修改完成后需要保存
            // appDelegate.saveContext()
        }
    }
    @IBAction func del(_ sender: Any) {
        //先构造一个请求对象
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            context.delete(p)
            //删除完成后需要保存
            // appDelegate.saveContext()
        }
    }
    @IBAction func query(_ sender: Any) {
        //先构造一个请求对象
        let fetch:NSFetchRequest<Person> = Person.fetchRequest()
        //断言
        fetch.predicate = NSPredicate(format: "name=%@", tfName.text!)
        let persons = try? context.fetch(fetch)
        if let p = persons?.first {
            tfPhone.text = p.phone
            tfSex.text = p.sex
            tfAge.text = p.age
        }
    }
}

