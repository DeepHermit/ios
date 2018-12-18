//
//  ViewController.swift
//  tenth
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var grayview: UIView!
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func move(_ sender: Any) {
        UIView.animate(withDuration:2){
            if(self.grayview.center.x != self.view.bounds.width){
                self.grayview.center.x = self.view.bounds.width
            }else{
                self.grayview.center.x = 200
            }
        }
    }
    @IBAction func size(_ sender: Any) {
        UIView.animate(withDuration:2,animations:{
            self.grayview.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }){
            (finished) in if finished{
                self.grayview.transform = CGAffineTransform(scaleX: 1, y: 1)        }
        }
    }
    @IBAction func transform(_ sender: Any) {
        UIView.animate(withDuration: 2,  animations: {
            self.grayview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.grayview.transform = CGAffineTransform.identity
            self.grayview.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            self.grayview.transform = CGAffineTransform.identity
        }){
            (finished) in if finished{
                self.grayview.backgroundColor = UIColor.black
            }
        }
    }
}

