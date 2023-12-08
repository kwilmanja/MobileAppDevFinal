//
//  GroupViewController.swift
//  MobileAppDevFinal
//
//  Created by Andrew Liu on 12/8/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class GroupsViewController: UIViewController {
    
    let groupScreen = GroupsScreenView()
    
    var groupsList = [Group]()
    
    var handleAuth: AuthStateDidChangeListenerHandle?
    let database = Firestore.firestore()
    var currentUser:FirebaseAuth.User?
    
    override func loadView() {
        view = groupScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Groups"

        //MARK: patching table view delegate and data source...
        groupScreen.tableViewGroups.delegate = self
        groupScreen.tableViewGroups.dataSource = self
        
        //MARK: removing the separator line...
        groupScreen.tableViewGroups.separatorStyle = .none
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: Reset tableView...
                self.groupsList.removeAll()
                self.groupScreen.tableViewGroups.reloadData()
                
            }else{
                //MARK: the user is signed in...
                self.currentUser = user
                
                //MARK: Observe Firestore database to display the tasks list...
                self.populateGroups()
            }
        }
    }
}
