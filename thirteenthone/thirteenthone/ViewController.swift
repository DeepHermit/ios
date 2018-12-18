//
//  ViewController.swift
//  thirteenthone
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sum: UILabel!
    @IBOutlet weak var time: UILabel!
    var count = 0
    var numbertime = 0
    var numbersum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.global().async {
            for i in 1...9999999{
                usleep(1)
                self.numbersum += i
            }
            DispatchQueue.main.async {
                self.sum.text = "\(self.numbersum)"
            }
        }
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.count += 1
            self.time.text = "\(self.count)"
            }.fire()
    }
    

}

