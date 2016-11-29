//
//  TasksTableViewController.swift
//  UsefulApp
//
//  Created by rem{e}koh on 11/13/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController, AddTaskItemViewControllerDelegate {
    
    var items: [TaskItem]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.items = [TaskItem]()
        
        let row0item = TaskItem()
        row0item.text = "Pray"
        row0item.checked = true
        
        items.append(row0item)
        
        let row1item = TaskItem()
        row1item.text = "Go running"
        row1item.checked = false
        
        items.append(row1item)
        
        let row2item = TaskItem()
        row2item.text = "Brush my teeth/Shower"
        row2item.checked = true
        
        items.append(row2item)
        
        let row3item = TaskItem()
        row3item.text = "Eat Breakfast"
        row3item.checked = false
        
        items.append(row3item)
        
        let row4item = TaskItem()
        row4item.text = "Learn iOS Development"
        row4item.checked = true
        
        items.append(row4item)


    }
    
    func addTaskItemViewControllerDelegate(item: TaskItem) {
        self.items.append(item)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let addTaskTableVC = segue.destination as? AddTaskItemViewController
        addTaskTableVC?.delegate = self
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskItemCell", for: indexPath)
        
        let item = items[indexPath.row]
        
//        let label = cell.textLabel?.text
//        
//        cell.textLabel?.text = item.text
        
        configText(for: cell, with: item)
        configCheckmark(for: cell, with: item)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {

            let item = items[indexPath.row]
//            item.checked = !item.checked
            
            item.toggleCheckmark()

            configCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configCheckmark(for cell: UITableViewCell, with item: TaskItem) {
      
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configText(for cell: UITableViewCell, with item: TaskItem){
        let label = cell.viewWithTag(75) as! UILabel
        
        label.text = item.text
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
    
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
