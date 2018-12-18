//
//  ViewController.swift
//  tenththree
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var grayView: UIView!
    lazy var animator = UIDynamicAnimator(referenceView: self.grayView)
    
    let gravity = UIGravityBehavior()
    let collision = UICollisionBehavior()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
    }
    @IBAction func add(_ sender: Any) {
        let width = Int(grayView.bounds.width / 10)
        let randx = Int(arc4random() % 10) * width
        let lable = UILabel(frame: CGRect(x: randx, y: 20, width: width, height: width))
        lable.backgroundColor = UIColor.white
        lable.text = "😊"
        lable.textAlignment = .center
        grayView.addSubview(lable)
        gravity.addItem(lable)
        collision.addItem(lable)
    }
    @IBAction func up(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: -1)
    }
    @IBAction func down(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 0, dy: 1)
    }
    @IBAction func left(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: -1, dy: 0)
    }
    @IBAction func right(_ sender: Any) {
        gravity.gravityDirection = CGVector(dx: 1, dy: 0)
    }
    @IBAction func del(_ sender: Any) {
        for item in grayView.subviews{
            if item is UILabel{
                //不能实现删除
                item.removeFromSuperview()
                //删除了lable，但位置并没有删除
                gravity.removeItem(item)
                collision.removeItem(item)
            }
        }
    }
    

}

