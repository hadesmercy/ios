import UIKit

class homeTableViewController: homeViewController, UITableViewDelegate, UITableViewDataSource  {
    
    private var habitsCellID = "todayHabitCell"
    
    
    func initHabitsListToday(){
        var temp:[Habit]
        if let abcd = loadFoodFile(){
            temp = abcd
      
        }else{
            temp = habitsList
        }
        
     
        for item in temp{
            if(item.today_not_check == true ){
                habitsListToday.append(item)
                
                
            }
        }
        
    }
    @IBOutlet weak var homeTableView: UITableView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initHabitsListToday()
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        self.homeTableView.rowHeight = 90
        
        
        

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return habitsListToday.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: habitsCellID, for: indexPath)
        print(cell)
        if let todayHabitsTableCell = cell as? homeTableViewCell {
        
            print("ok")
            todayHabitsTableCell.todayHabitAvator.image =
                habitsListToday[indexPath.row].habitAvator
            todayHabitsTableCell.todayHabitName.text=habitsListToday[indexPath.row].name
            todayHabitsTableCell.todayHabitReminder.text=habitsListToday[indexPath.row].reminder
            
        }
    
        
        return cell
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
            
            for item in habitsList{
                if (item.name == habitsListToday[indexPath.row].name){
                    item.today_not_check = false
                    item.total_time!+=1
                    break
                }
            }
            habitsListToday.remove(at: indexPath.row)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
