//
//  ViewController.swift
//  App12
//
//  Created by Sakib Miazi on 6/1/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ViewController: UIViewController {

    let mainScreen = MainScreenView()
        
    var tasksList = [Task]()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    var currentUser:FirebaseAuth.User?
    
    let database = Firestore.firestore()
    
    let childProgressView = ProgressSpinnerViewController()
    
    var groups = [Group]()
        
    override func loadView() {
        view = mainScreen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: Reset tableView...
                self.tasksList.removeAll()
                self.mainScreen.tableViewTasks.reloadData()
                
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                self.mainScreen.labelText.text = "Welcome \(user?.displayName ?? "New User")!" // TODO delete
                
                //MARK: Observe Firestore database to display the tasks list...
                self.populateGroups()
                self.populateTasks()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tasks"
        
        //MARK: patching table view delegate and data source...
        mainScreen.tableViewTasks.delegate = self
        mainScreen.tableViewTasks.dataSource = self
        
        //MARK: removing the separator line...
        mainScreen.tableViewTasks.separatorStyle = .none
        
        
        let barText = UIBarButtonItem(title: "Add Task", style: .plain, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = barText
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    
    @objc func addTask(){
        let addTaskController = AddTaskViewController()
        addTaskController.currentUser = self.currentUser
        addTaskController.groups = self.groups
        navigationController?.pushViewController(addTaskController, animated: true)
    }
}

