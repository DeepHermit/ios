//
//  pinchViewController.swift
//  ninththree
//
//  Created by student on 2018/12/5.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class pinchViewController: UIViewController,UIScrollViewDelegate{

    
    @IBOutlet weak var scrollControl: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollControl.delegate=self
        let image = UIImageView(image: UIImage(named: "1"))
        scrollControl.addSubview(image)
        scrollControl.contentSize = image.bounds.size
        scrollControl.maximumZoomScale = 2
        scrollControl.minimumZoomScale = 0.5
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView.subviews.first
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
