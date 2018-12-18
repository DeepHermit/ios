//
//  WeatherViewController.swift
//  实验13 第二题
//
//  Created by apple on 2018/12/03.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit
import Alamofire
class WeatherViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var heightTempLabel: UILabel!
    var id:String?
    override func viewDidLoad() {

        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Alamofire.request("http://www.weather.com.cn/data/cityinfo/\(id!).html").responseJSON(completionHandler: { (response) in
            if let json = try? JSON(data: response.data!) {
                self.cityLabel.text = "城市：" + json["weatherinfo"]["city"].description
                self.lowTempLabel.text = "最低温度：" + json["weatherinfo"]["temp1"].description
                self.heightTempLabel.text = "最高温度:" + json["weatherinfo"]["temp2"].description
                self.weatherLabel.text = "天气：" + json["weatherinfo"]["weather"].description
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
