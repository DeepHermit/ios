//: Playground - noun: a place where people can play

import UIKit

let manager = FileManager.default
let document = manager.urls(for:.documentDirectory,in: .userDomainMask).first?.path
let file = document?.appending("/img")
print(document!)
if manager.fileExists(atPath: file!) {  //若该文件夹存在
    let image = file?.appending("/小埋.png")  //图片文件
    if manager.fileExists(atPath: image!) {  //若该文件存在，则显示到界面上
        let data = try Data(contentsOf: URL(fileURLWithPath: image!))
        let img = UIImage(data: data)
        let imageView = UIImageView(image: img)
        imageView.frame = CGRect(x: 0, y: 100, width: 300, height: 200)
//        self.view.addSubview(imageView)
    } else {  //若不存在，则从网络下载一个图片并保存为图片文件
        let url = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544703591337&di=44e25c1024f0156e0883e949663590d4&imgtype=0&src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farticle%2Ffafb987e8202a62eb055c43099e48909e8b6a193.jpg")
        let data = try Data(contentsOf: url!)
        try data.write(to: URL(fileURLWithPath: image!), options: .atomicWrite)
        print("图片不存在，成功下载了新图片")
    }
} else {  //若该文件夹不存在，则创建该文件夹
    try manager.createDirectory(atPath: file!, withIntermediateDirectories: true, attributes: nil)
    print("文件夹不存在，成功创建了新文件夹!")
}
