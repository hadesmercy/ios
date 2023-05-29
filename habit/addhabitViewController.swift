import UIKit

class addhabitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "习惯名称"
        nameField.text = habitForEdit?.name
        reminderField.text = habitForEdit?.reminder
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var nameLabel: UILabel!
    var habitForEdit: Habit?
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var reminderField: UITextField!
    //点击空白或者键盘done 可以收起键盘
    @IBAction func textFieldDoneEditing(sender:UITextField){
        sender.resignFirstResponder()
        print("键盘点击退出了")
    }
    //这个函数点击背景关闭键盘
    @IBAction func backgroundTap(sender:UIControl){
        reminderField.resignFirstResponder()
        nameField.resignFirstResponder()
        print("背景点击退出了")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        habitForEdit = Habit(name: nameField.text,reminder: reminderField.text)
    }

}
