//
//  TaskViewController.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/6/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class TaskViewController: UIViewController {


    let taskScreen = TaskView()
        
    var task: Task!
    var currentUser: FirebaseAuth.User!
            
    let database = Firestore.firestore()
    
    var groups = [Group]()
    
    
    override func loadView() {
        view = taskScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = task.title
        
        self.taskScreen.labelGroup.text = "Group: \(task.group)"
        self.taskScreen.labelDescription.text = "Description: \(task.description)"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/y"
        let formattedDate = dateFormatter.string(from: task.date.dateValue())
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let formattedTime = dateFormatter.string(from: task.date.dateValue())
        self.taskScreen.labelDate.text = "\(formattedDate) \(formattedTime)"
        
        
//        taskScreen.buttonDone.addTarget(self, action: #selector(onButtonDoneTapped), for: .touchUpInside)
        
        // recognizing the taps on the app screen, not the keyboard
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
        
        
        let barText = UIBarButtonItem(title: "Edit Task", style: .plain, target: self, action: #selector(editTask))
        navigationItem.rightBarButtonItem = barText
        
    }
    
    
    @objc func editTask(){
        let editTaskController = AddTaskViewController()
        editTaskController.currentUser = self.currentUser
        editTaskController.groups = self.groups
        editTaskController.task = self.task
        
        navigationController?.pushViewController(editTaskController, animated: true)
    }
    
    
    // hide keyboard
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    

}
