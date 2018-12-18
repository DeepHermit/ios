//
//  ViewController.swift
//  tenthtwo
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var grayView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func backChange(_ sender: Any) {
        UIView.transition(with: grayView, duration: 2, options: .transitionCurlUp,animations:{
            self.grayView.backgroundColor = UIColor.blue
        },completion: nil)
    }
    @IBAction func viewChange(_ sender: Any) {
        let imageView = UIImageView(frame:CGRect(x:100,y:100,width:230,height:230))
        imageView.image = UIImage(named: "image")
        UIView.transition(from: grayView, to: imageView, duration: 4, options: .transitionFlipFromRight, completion: nil)
    }
}

