# swift learning: a test app - weather report

几个学习点：
- get json data from remote url
- data type 
- UI bind with Controller

几点问题：
+ json 类型转换时会出现字符串显示 Optional(<str>) 的情况，用!貌似能解决;
+ 请求远程url的时候程序可能会出于安全考虑禁止访问，需要修改Info.plist文件，添加 App Transport Security Settings 这个Dictionary 和对应key;

