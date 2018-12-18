//
//  gview.swift
//  ninthone
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class gview: UIView {
    @IBInspectable var color: UIColor?
    
    func setup(){
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 2
        
        
    }
    @objc func pan(recognizer:UIPanGestureRecognizer){
        if recognizer.state == .changed || recognizer.state == .ended{
            let translation = recognizer.translation(in: self)
            self.center.x += translation.x
            self.center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        }
    }
    @objc func pinch(recognizer:UIPinchGestureRecognizer){
        if recognizer.state == .changed || recognizer.state == .ended{
            bounds = CGRect(x: 0, y: 0, width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1
        }
    }
    @objc func tap(recognizer: UITapGestureRecognizer){
        if recognizer.state == .recognized{
            print("tap")
        }
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        color?.setFill()
        path.fill()
    }
}
