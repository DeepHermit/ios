//
//  ViewController.swift
//  eleventhone
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {

    var person = Person()
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var no: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        name.text = person.name
        no.text = person.no
    }
    @IBAction func next(_ sender: Any) {
        let sec = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "secVC") as! secViewController
        person.name = name.text!
        person.no = no.text!
        sec.person = self.person
        self.navigationController?.pushViewController(sec, animated: true)
    }
}

