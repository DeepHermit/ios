//
//  ViewController.swift
//  fifth
//
//  Created by student on 2018/10/27.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.black
        
        let label = UILabel(frame: CGRect(x: 200, y: 200, width: 400, height: 100))
        label.text = "Hello World!";
        label.backgroundColor = UIColor.white;
        label.textColor = UIColor.black;
        label.textAlignment = .center;
        label.center = view.center;
        self.view.addSubview(label);
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 200, height: 100));
        button.setTitle("Please click!", for: .normal);
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.white;
        self.view.addSubview(button);
        
        button.addTarget(self, action: #selector(click), for: .touchUpInside);
    }
    @IBAction func click(){
        if let label = view.subviews.first as? UILabel{
            label.text = "You will creat a new world!"
            label.backgroundColor = UIColor.red;
            label.textColor = UIColor.black;
        }
    }
}

