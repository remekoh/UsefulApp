//
//  AddTaskItemViewController.swift
//  UsefulApp
//
//  Created by rem{e}koh on 11/14/16.
//  Copyright © 2016 rem{e}koh. All rights reserved.
//

import UIKit

protocol AddTaskItemViewControllerDelegate: class {
    
    func addTaskItemViewControllerDelegate(item: TaskItem)
    
}

class AddTaskItemViewController: UIViewController {
    
    weak var delegate: AddTaskItemViewControllerDelegate!
    
    @IBOutlet weak var addNewTaskitemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addTaskButtonPressed(_ sender: AnyObject) {
        
        let item = TaskItem()
        item.text = self.addNewTaskitemTextField.text!
        item.checked = false
        
        self.delegate.addTaskItemViewControllerDelegate(item: item)
        
         self.dismiss(animated: true, completion: nil)
        
        
    }
    
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
