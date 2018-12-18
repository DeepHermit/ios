//
//  ViewController.swift
//  ninthtwo
//
//  Created by student on 2018/12/5.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "action sheet", message: "this is an ation sheet", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "gray", style: .default, handler: { (action) in
            self.view.backgroundColor = UIColor.gray
        }))
        alert.addAction(UIAlertAction(title: "blue", style: .destructive, handler: { (action) in
            self.view.backgroundColor = UIColor.blue
        }))
        alert.addAction(UIAlertAction(title: "White", style: .cancel, handler: { (action) in
            self.view.backgroundColor = UIColor.white
        }))
        present(alert, animated: true, completion: nil)
    }
    @IBAction func loginSheet(_ sender: Any) {
        let alert = UIAlertController(title: "Login", message: "Please input your  information", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in}))
        alert.addTextField { (textField) in
            textField.placeholder = "your user name?"
        }
        alert.addTextField { (textField) in
            textField.placeholder = "your password?"
            textField.isSecureTextEntry = true
        }
        present(alert, animated: true, completion: nil)
    }
}

