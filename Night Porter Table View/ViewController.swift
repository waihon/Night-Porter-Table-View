//
//  ViewController.swift
//  Night Porter Table View
//
//  Created by Waihon Yew on 21/04/2018.
//  Copyright © 2018 Pringgle Media. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // Create [String] arrays of tasks
    var dailyTasks = [
        Task(name: "Check all windows", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check all doors", type: .daily, completed: true, lastCompleted: nil),
        Task(name: "Is the boiler fueled?", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mailbox", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Empty trash containers", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "If freezing, check water pipes", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Document \"strange and unusual\" occurences", type: .daily, completed: false, lastCompleted: nil)
    ]
    
    var weeklyTasks = [
        Task(name: "Check inside all cabins", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Flush all lavatories in cabins", type: .weekly, completed: false, lastCompleted: nil),
        Task(name: "Walk the perimeter of property", type: .weekly, completed: false, lastCompleted: nil)
    ]
    
    var monthlyTasks = [
        Task(name: "Test security alarm", type: .monthly, completed: false, lastCompleted: nil),
        Task(name: "Test motion detectors", type: .monthly, completed: false, lastCompleted: nil),
        Task(name: "Test smoke alarms", type: .monthly, completed: false, lastCompleted: nil),
    ]

    @IBOutlet weak var tasksTableView: UITableView!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white
        }
        
        tasksTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Table View Data Source Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        var currentTask: Task!
        
        switch indexPath.section {
        case 0:
            currentTask = dailyTasks[indexPath.row]
        case 1:
            currentTask = weeklyTasks[indexPath.row]
        case 2:
            currentTask = monthlyTasks[indexPath.row]
        default:
            break
        }
        
        cell.textLabel?.text = currentTask.name
        
        cell.backgroundColor = UIColor.clear
        
        if currentTask.completed {
            if darkModeSwitch.isOn {
                cell.textLabel?.textColor = UIColor.lightGray
            } else {
                cell.textLabel?.textColor = UIColor.lightGray
            }
            cell.accessoryType = .checkmark
        } else {
            if darkModeSwitch.isOn {
                cell.textLabel?.textColor = UIColor.white
            } else {
                cell.textLabel?.textColor = UIColor.black
            }
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    }
    
    // Table View Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
}

