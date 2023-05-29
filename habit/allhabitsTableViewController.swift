import UIKit

class allhabitsTableViewController:habitsViewController,UITableViewDataSource,UITableViewDelegate
{
    private var habitsCellID = "habitsCell"
    
    //var habitsList: [Habit] = [Habit]()
    let defaultImg = UIImage (named:"myHabit")
    func initHabitsList(){

        if let abcd = loadFoodFile(){
            habitsList = abcd
        }else{
             habitsList.append(Habit(name: "吃饭", img: UIImage (named:"1"), reminder:"饿了要吃饭"))
             habitsList.append(Habit(name: "睡觉", img: UIImage (named:"2"), reminder:"困了要睡觉"))
        }
            
        
    }
    
    //    持久化数据
       func saveFoodList(){
        print("gjhghji")
        let sucess = NSKeyedArchiver.archiveRootObject(habitsList, toFile: Habit.ArchiveURL.path)
           print("hji")
           if !sucess{
               print("Failed ...")
           }
       }
       
       func loadFoodFile()->[Habit]?{
           return (NSKeyedUnarchiver.unarchiveObject(withFile: Habit.ArchiveURL.path) as?[Habit])
       }
       
    
    
    //添加新的习惯
    @IBAction func saveToList(seque: UIStoryboardSegue){
        if let addHabitVC = seque.source as? addhabitViewController{
            if let addHabit = addHabitVC.habitForEdit{
                if let selectedIndexPath = allhabitsTableView.indexPathForSelectedRow{
                    habitsList[(selectedIndexPath as NSIndexPath).row] = addHabit
                    allhabitsTableView.reloadRows(at: [selectedIndexPath], with: .none)
                }else{
                    habitsList.append(addHabit)
                    let newIndexPath = IndexPath(row: habitsList.count-1, section: 0)
                    allhabitsTableView.insertRows(at: [newIndexPath], with: .automatic)
                }
                print("1")
                saveFoodList()
                print("2")
            }
        }
    }

    
    @IBOutlet weak var allhabitsTableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        initHabitsList()
        allhabitsTableView.delegate = self
        allhabitsTableView.dataSource = self
        self.allhabitsTableView.rowHeight = 90
    }
    
    
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return habitsList.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: habitsCellID, for: indexPath)
        
        if let allHabitsTableCell = cell as? allhabitsTableViewCell {
        
            allHabitsTableCell.imageOfHabit.image =
                habitsList[indexPath.row].habitAvator
            allHabitsTableCell.NameOfHabit.text=habitsList[indexPath.row].name
            allHabitsTableCell.FlagOfHabit.text=habitsList[indexPath.row].reminder
            
            allHabitsTableCell.times.text = String(habitsList[indexPath.row].total_time!)
            
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //选中对应的cell

    }
   
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            habitsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        saveFoodList()
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let descriptionVC = segue.destination as? addhabitViewController{
              print("1.1")
              if let selectedCell = sender as? UITableViewCell{
                  print("2")
                  let indexPath = allhabitsTableView.indexPath(for: selectedCell)!
                  let selectedHabit = habitsList[(indexPath as NSIndexPath).row]
                  descriptionVC.habitForEdit = selectedHabit
                  
              }
          }
    }
    

}
