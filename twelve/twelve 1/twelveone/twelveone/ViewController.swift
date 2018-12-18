//
//  ViewController.swift
//  twelveone
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit
import SQLite3
class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phone: UITextField!
    let db = SQLiteDB.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        print(Bundle.main.bundlePath)
        db.open(dbPath: "DB/data.db", copyFile: true)
        let result = db.execute(sql: "create table if not exists person(name varchar(20),phone varchar(20))")
    }

    @IBAction func add(_ sender: Any) {
        let result = db.execute(sql: "insert into person(name,phone) values('\(name.text!)','\(phone.text!)')")
    }

    @IBAction func update(_ sender: Any) {
        let result = db.execute(sql: "update person set phone ='\(phone.text!)' where name = '\(name.text!)'")

    }
    @IBAction func del(_ sender: Any) {
        let result = db.execute(sql: "delete from person where name = '\(name.text!)'")
    }
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(name.text!)'")
        if let person = persons.first {
            phone.text = person["phone"] as? String
        }
    }
}

