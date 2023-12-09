//
//  GroupViewController.swift
//  MobileAppDevFinal
//
//  Created by Andrew Liu on 12/8/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class GroupViewController: UIViewController {
    
    var currentUser: FirebaseAuth.User!
    let database = Firestore.firestore()
    
    let groupScreenView = GroupScreenView()
    
    var group: Group!
    
    override func loadView() {
        view = groupScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = group.name
        updateUsers(group.users)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit Group", style: .plain, target: self, action: #selector(editGroup))
        
        self.groupScreenView.buttonDelete.addTarget(self, action: #selector(deleteGroup), for: .touchUpInside)
    }

    func updateUsers(_ users: [String]) {
        var usersString = ""
        for user in users {
            usersString.append("\(user)\n")
        }
        groupScreenView.users.numberOfLines = users.count + 1
        groupScreenView.users.text = usersString
    }
    
    @objc func deleteGroup() {
        database.collection("groups").document(group.id!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
                self.deleteGroupFromUser()
            }
        }
    }
    
    @objc func editGroup() {
        let editGroupController = AddGroupViewController()
        editGroupController.currentUser = self.currentUser
        editGroupController.users = self.group.users
        editGroupController.group = self.group
        
        navigationController?.pushViewController(editGroupController, animated: true)
    }
    
    func deleteGroupFromUser() {
        database.collection("users").document(currentUser.email!).collection("groups").document(group.id!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
