//
//  myHabitsTableViewController.swift
//  habit
//
//  Created by ZYY on 2019/12/14.
//  Copyright © 2019 ZYY.4.17.SE.SCUT. All rights reserved.
//

import UIKit

class myHabitTableViewController: myHabitViewController, UITableViewDelegate, UITableViewDataSource{
    var habitList : [Habit] = [Habit]()
    func initHabitList(){
        habitList.append(Habit(name: "Brush teeth",img:UIImage(named: "1"),reminder: "每天都要刷牙哦"))
        habitList.append(Habit(name: "Memorize vocabularies",img:UIImage(named: "2"),reminder: "记的记单词"))
        habitList.append(Habit(name: "Exercise for 1 hour",img:UIImage(named: "3"),reminder: "锻炼身体倍倍棒"))
        habitList.append(Habit(name: "Take the medicine",img:UIImage(named: "4"),reminder: "出门记得吃药"
        ))
        habitList.append(Habit(name: "Take a nap",img:UIImage(named: "5"),reminder: "祝你秀发长青"))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initHabitList()

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
        return habitList.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = habitList[indexPath.row].name
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

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
