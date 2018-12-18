//
//  ViewController.swift
//  thirteenthtwo
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {


    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "http://www.baidu.com"){
            webView.load(URLRequest(url: url))
        }
    }
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
    @IBAction func forward(_ sender: Any) {
        webView.goForward()
    }
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    @IBAction func go(_ sender: Any) {
        if let url = URL(string: textField.text ?? "") {
            webView.load(URLRequest(url: url))
        }
    }
}

