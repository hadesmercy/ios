/*
 习惯类
 属性
 ID序号（唯一索引）
 名字
 图标
 颜色【若干安全色枚举】
 提醒语
 坚持时间
 打卡时间类别【7个枚举属性】：起床 早上 中午 下午 晚上 睡前 任何时间
 //是否已经放弃
 
    习惯派生类
    每天习惯类
 属性
 
 每周习惯类
    每周打卡时间
 本周已打卡次数
    每月习惯类
 本月已打卡次数
    每月打卡次数
 */
import Foundation
import UIKit
enum TimeClass {
    case GETUP
    case MORING
    case NOON
    case AFTERNOON
    case EVENING
    case BEFORESLEEP
    case ANYTIME
}
class Habit : NSObject, NSCoding{
    var name:String?
    var habitAvator: UIImage?
    var reminder:String?
    var today_not_check:Bool?
    var habitAvatorId: String?
    var total_time:Int?
    
    static let DocumentDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentDirectory.appendingPathComponent("habitsList")
    
    func encode(with aCoder: NSCoder) {
           aCoder.encode(name,forKey: "nameKey")
           aCoder.encode(habitAvatorId,forKey: "habitAvatorIdkey")
           aCoder.encode(reminder,forKey: "reminderKey")
           aCoder.encode(total_time,forKey: "total_timeKey")
        aCoder.encode(today_not_check,forKey: "today_not_checkKey")
       }
    required init?(coder aDecoder: NSCoder){
        name = aDecoder.decodeObject(forKey: "nameKey") as? String
        habitAvatorId = aDecoder.decodeObject(forKey: "habitAvatorIdkey") as? String
        habitAvator=UIImage(named:habitAvatorId ?? "25")
        reminder = aDecoder.decodeObject(forKey: "reminderKey") as? String
        total_time = aDecoder.decodeObject(forKey: "total_timeKey") as? Int
        today_not_check = aDecoder.decodeObject(forKey: "today_not_checkKey") as? Bool
    }
    //这些是之前写过但是没有用的属性
    var id:Int?
    var stick_to_time:Int?
    var time_class:TimeClass?
   //这个初始化函数没有用
    init(id:Int,name:String,reminder:String,time_class:TimeClass) {
        self.id=id
        self.name=name
        self.reminder=reminder
        self.time_class=time_class
        self.total_time=0
         self.today_not_check=true
    }
    //这个初始化函数也基本没啥用
    init(name: String?, img: UIImage?, reminder: String?){
        self.name=name
        self.habitAvator = img
        self.reminder = reminder
        self.total_time=0
         self.today_not_check=true
    }
    //这是没有选择图标的函数，所以随机一个
    init(name: String?, reminder: String?){
        self.name=name
        
        let NwNumber2 = arc4random() % 30+1
        let imageInt=String(NwNumber2)
        self.habitAvatorId = imageInt
        self.habitAvator = UIImage(named:imageInt)
        self.reminder = reminder
        self.total_time=0
        self.today_not_check=true
    }
    
    func show_habit(){
        
        print("id",self.id)
        print("name",self.name)
        print("total_time",self.total_time)
        print("reminder",self.reminder)
        print(" ")
    }
    
}
