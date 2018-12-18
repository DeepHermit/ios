import UIKit
import PlaygroundSupport
class MyView:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.blue.setStroke()//蓝色边框
        path.stroke()
        UIColor.yellow.setFill()//黄色填充
        path.fill()
    }
}
class Controller: UIViewController {
    var lable:UILabel!
    var circle:MyView!
    override func loadView() {
        view = UIView(frame: CGRect(x:0,y:0,width:400,height:1000))
        view.backgroundColor = UIColor.blue
        //创建圆
        let circle = MyView(frame: CGRect(x: 100, y: 300, width: 200, height: 100))
        circle.backgroundColor = UIColor.clear
        view.addSubview(circle)
        
    }
}
let c = Controller()
PlaygroundPage.current.liveView = c
