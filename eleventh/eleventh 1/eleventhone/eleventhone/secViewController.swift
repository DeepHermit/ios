//
//  secViewController.swift
//  eleventhone
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 xuelian. All rights reserved.
//

import UIKit

class secViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var no: UITextField!
    var person:Person?
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = person?.name
        no.text = person?.no
        // Do any additional setup after loading the view.
    }
    @IBAction func back(_ sender: Any) {
        person?.name = name.text!
        person?.no = no.text!
        navigationController?.popViewController(animated: true)
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
