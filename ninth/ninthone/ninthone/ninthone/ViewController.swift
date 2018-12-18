//
//  ViewController.swift
//  ninthone
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bigView = UIView(frame: CGRect(x: 100, y: 20, width: 150, height: 550))
        bigView.backgroundColor = UIColor.gray
        bigView.layer.opacity = 0.5
        let rotationRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(rotation(recognizer:)))
        bigView.addGestureRecognizer(rotationRecognizer)
        self.view.addSubview(bigView)
    }
    
    @objc func rotation(recognizer:UIRotationGestureRecognizer){
        if recognizer.state == .ended{
            recognizer.view?.transform = (recognizer.view?.transform.rotated(by: recognizer.rotation))!
        }
    }
    
    
    @IBAction func add(_ sender: Any) {
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height-50)
        
        let lable = UILabel(frame: CGRect(x: x, y: y, width: 50, height: 50))
        lable.text = "D"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.gray
        
        lable.layer.shadowColor = UIColor.black.cgColor
        lable.layer.shadowOffset = CGSize(width: 10, height: 10 )
        lable.layer.shadowOpacity = 1
        lable.layer.shadowRadius = 5;
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer: )))
        lable.addGestureRecognizer(panRecognizer)
        lable.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer: )))
        lable.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 2
        
        self.view.addSubview(lable)
        
    }
    @objc func pan(recognizer:UIPanGestureRecognizer){
        if recognizer.state == .changed || recognizer.state == .ended{
            let traslation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += traslation.x
            recognizer.view?.center.y += traslation.y
            recognizer.setTranslation(.zero, in: self.view)
        }
    }
    @objc func tap(recognizer:UITapGestureRecognizer){
        if recognizer.state == .recognized{
            recognizer.view?.removeFromSuperview()
        }
    }
    @IBAction func move(_ sender: Any) {
        for lable in self.view.subviews{
            if lable is UILabel{
                UIView.animate(withDuration: 1){
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height - 50)
                    lable.center = CGPoint(x: x+25, y: y+25)
                }
            }
        }
    }
    @IBAction func view_clear(_ sender: Any) {
        for lable in self.view.subviews {
            if lable is UILabel {
                lable.removeFromSuperview()
            }
        }
    }
}

