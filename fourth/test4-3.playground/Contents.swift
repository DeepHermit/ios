import UIKit

import PlaygroundSupport
class Controller:UIViewController{
    var label:UILabel!
    override func loadView() {
        view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 100))
        view.backgroundColor = UIColor.yellow
        
        label = UILabel(frame: CGRect(x: 100, y: 200, width: 200, height: 50))
        label.backgroundColor = UIColor.blue
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = "Hello World"
        view.addSubview(label)
        
        let button = UIButton(frame: CGRect(x: 100, y: 550, width: 200, height: 50))
        button.backgroundColor = UIColor.orange
        button.setTitle("Click me!", for: .normal)
        button.addTarget(self, action: #selector(Controller.clicked), for: .touchUpInside)
        view.addSubview(button)
    }
    @IBAction func clicked(){
        print("Hi!You are a cute girl!")
        label?.text = "Hi!You are a cute girl!"
    }
}
let c = Controller()
PlaygroundPage.current.liveView = c
