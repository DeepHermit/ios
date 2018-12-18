//
//  ViewController.swift
//  sixth-three
//
//  Created by student on 2018/10/27.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let blackView = UIView();
        blackView.backgroundColor = UIColor.black;
        let grayView = UIView();
        grayView.backgroundColor = UIColor.gray;
        let greenView = UIView();
        greenView.backgroundColor = UIColor.green;
        
        let stackView = UIStackView(arrangedSubviews: [blackView,grayView,greenView]);
        stackView.axis = .vertical;
        stackView.alignment = .fill;
        stackView.distribution = .fillEqually;
        stackView.spacing = 20;
        
        view.addSubview(stackView);
        
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true;
        stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive=true;
        stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive=true;
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive=true;
    }

}

