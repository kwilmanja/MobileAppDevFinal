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
                self.mainScreen.tableViewContacts.reloadData()
                
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                self.mainScreen.labelText.text = "Welcome \(user?.displayName ?? "Anonymous")!" // TODO delete
                
                //MARK: Observe Firestore database to display the tasks list...
                self.populateGroups()
                self.populate()
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Tasks"
        
        //MARK: patching table view delegate and data source...
        mainScreen.tableViewContacts.delegate = self
        mainScreen.tableViewContacts.dataSource = self
        
        //MARK: removing the separator line...
        mainScreen.tableViewContacts.separatorStyle = .none
        
        
        let barText = UIBarButtonItem(title: "Add Task", style: .plain, target: self, action: #selector(addTask))
        navigationItem.rightBarButtonItem = barText
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    

    
//
//    func showError(_ msg: String) {
//        let alert = UIAlertController(title: "Error!", message: msg, preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//
//        self.present(alert, animated: true)
//    }
    
    @objc func addTask(){
        let addTaskController = AddTaskViewController()
        addTaskController.currentUser = self.currentUser
        addTaskController.groups = self.groups
        navigationController?.pushViewController(addTaskController, animated: true)
    }
}

