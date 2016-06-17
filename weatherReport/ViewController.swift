//
//  ViewController.swift
//  weatherReport
//
//  Created by Virola on 16/6/17.
//  Copyright © 2016年 Virola. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textview:UITextView!;
    
    @IBAction func btnPressed(sender: AnyObject) {
        //print("button clicked!");
        textview.text = "正在加载天气信息...";
        loadWeather();
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadWeather();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadWeather() {
        
        let url = NSURL(string: "http://www.weather.com.cn/data/sk/101250101.html");
        let data: NSData = NSData.init(contentsOfURL: url!)!;
        //var str = NSString(data: data, encoding: NSUTF8StringEncoding);
        
        
        // type 1
        // 确定变量类型的写法就是比较麻烦，类型转换不灵活，维护起来也心累
//        let json = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments);
//        let weatherInfo: AnyObject! = json.objectForKey("weatherinfo");
//        let city: String = weatherInfo.objectForKey("city") as! String;
//        let temp = weatherInfo.objectForKey("temp") as! String;
//        let updateTime = weatherInfo.objectForKey("time") as! String;
//        textview.text = "城市: " + city + "\n温度: " + temp + "\n更新: " + updateTime;
        
        
        // type 2
        // 不确定变量类型的写法，不能理解这语法，多了这么多问号? 但总的来说维护会轻松一些
        let json = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments);
        
        let weatherInfo = json?.objectForKey("weatherinfo");
        let city = weatherInfo?.objectForKey("city");
        let temp = weatherInfo?.objectForKey("temp");
        let updateTime = weatherInfo?.objectForKey("time");
        textview.text = "城市: \(city!)\n温度: \(temp!)℃ \n更新时间: \(updateTime!)";
        
    }


}

