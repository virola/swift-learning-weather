//: Playground - noun: a place where people can play

import Cocoa

// load

var url = NSURL(string: "http://www.weather.com.cn/data/sk/101250101.html");
var data: NSData = NSData.init(contentsOfURL: url!)!;
//var str = NSString(data: data, encoding: NSUTF8StringEncoding);

var json: AnyObject! = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments);

var weatherInfo: AnyObject! = json.objectForKey("weatherinfo");
var city = weatherInfo.objectForKey("city");
var temp = weatherInfo.objectForKey("temp");
var updateTime = weatherInfo.objectForKey("time");

