import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func pushBtnClick(_ sender: Any) {
           
           if #available(iOS 10.0, *) {
               
               // 1.设置触发条件
               let timeTrigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 0.5, repeats: false)
               // 2.创建通知内容
               let content = UNMutableNotificationContent.init()
               content.body = "BUPTER，快来完成今天的任务"
               content.badge = NSNumber(value:(UIApplication.shared.applicationIconBadgeNumber + 1))
            content.sound = UNNotificationSound.default
               let detail = "检查21天就能养成好习惯"
               let userInfo:Dictionary<String,String>=["detail":detail]
               content.userInfo = userInfo
               // 3.通知标识
               let requestIdentifier = NSString.init(format: "%lf", NSDate().timeIntervalSince1970)
               // 4.创建通知请求，将1，2，3添加到请求中
               let request = UNNotificationRequest(identifier: requestIdentifier as String, content: content, trigger: timeTrigger)
               UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
                   
                   if error == nil {
                       print("推送成功")
                   }
               })
               
           } else {
               
               let notification = UILocalNotification.init()
               notification.alertBody = "BUPTER，快来完成今天的任务"
               notification.applicationIconBadgeNumber = UIApplication.shared.applicationIconBadgeNumber + 1
               notification.soundName = UILocalNotificationDefaultSoundName
               let detail = "检查21天就能养成好习惯"
               let userInfo:Dictionary<String,String>=["detail":detail]
               notification.userInfo = userInfo
               DispatchQueue.main.asyncAfter(wallDeadline: DispatchWallTime.now()+5.0) {
                   
                   UIApplication.shared.presentLocalNotificationNow(notification)
               }
           }
       }
       
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
           // Dispose of any resources that can be recreated.
       }



}
