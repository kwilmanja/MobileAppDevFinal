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
    
    var photo : UIImage?
    
    override func loadView() {
        view = taskScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = task.title
        
        self.taskScreen.labelGroup.text = "Group: \(task.group)"
        self.taskScreen.labelDescription.text = task.description
        self.taskScreen.buttonDelete.addTarget(self, action: #selector(deleteTask), for: .touchUpInside)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/y"
        let formattedDate = dateFormatter.string(from: task.date.dateValue())
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let formattedTime = dateFormatter.string(from: task.date.dateValue())
        self.taskScreen.labelDate.text = "\(formattedDate) \(formattedTime)"
        self.populateTaskPhoto(taskId: task.id!)
        
        
        if(task.photoURL.count > 0){
            self.taskScreen.taskPic.loadRemoteImage(from: task.photoURL)
        }
        
        
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
    
    
    @objc func deleteTask(){
        
        for g in self.groups{
            if(g.name == task.group){
                database.collection("groups").document(g.id!)
                    .collection("tasks").document(task.id!).delete() { err in
                  if let err = err {
                    print("Error removing document: \(err)")
                  } else {
                    print("Document successfully removed!")
                    self.navigationController?.popViewController(animated: true)
                  }
                }
            }
        }
        
        
    }
    

}
