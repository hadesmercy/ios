//
//  homeViewController.swift
//  habit
//
//  Created by 魏一戈 on 2019/12/16.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    override func viewDidLoad() {
       
        super.viewDidLoad()
        getLastUpdate()
        showUpdate()
        

        // Do any additional setup after loading the view.
    }
    
  
    
    
    
    //<!-- 一下内容全部与更新时间有关系，放到所有和需要更新今天打卡操作的有关系的地方，包括但不限于 今天打卡的viewDidLoad()函数里面-- >
    func initTime(){
        if let abcd = loadLUP()
        {
            lastUpDate = abcd
        }
        else{
            lastUpDate = lastUpDateClass()
        }
    }
    
    func getLastUpdate()->lastUpDateClass{
        if let abcd = loadLUP()
               {
                   lastUpDate = abcd
               }
               else{
                   lastUpDate = lastUpDateClass()
               }
        return lastUpDate
    }
    
    func saveLUD(){
     print("gjhghji")
        lastUpDate.setDate()
        let sucess = NSKeyedArchiver.archiveRootObject(lastUpDate, toFile:lastUpDateClass.ArchiveURL.path)
        print("hji")
        if !sucess{
            print("Failed ...")
        }
    }
    
    func loadLUP()->lastUpDateClass?{
        print("加载上一次的时间")
        return (NSKeyedUnarchiver.unarchiveObject(withFile: lastUpDateClass.ArchiveURL.path) as?lastUpDateClass)
    }
    
    //日期到字符串的转换
    //dateFormat:String = "yyyy-MM-dd HH:mm"
    //这个是用于解析Date成String 的格式器
    //为了调试显眼，我改为一分钟首页的就更新一次
    //但是实际上如果把"yyyy-MM-dd  HH:mm" 改成"yyyy-MM-dd"就可以实现一天更新一次
    func date2String(_ date:Date, dateFormat:String = "yyyy-MM-dd  HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: date)
        return date
    }
    
    //当前需要更新
    func showUpdate()->Bool{
        let nowDate = Date()
        let lastDate = getLastUpdate()
        print("当前时间")
        print(nowDate)
        print("上一次的时间")
        print(lastUpDate.getDate())
        if (date2String(lastUpDate.getDate())==date2String(nowDate)){
            print("今天的打卡列表不需要更新了")
            return false
        }
        else{
            print("今天的打卡列表需要更新了")
            return true
        }
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
