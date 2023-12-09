//
//  AddGroupViewController.swift
//  MobileAppDevFinal
//
//  Created by Andrew Liu on 12/8/23.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class AddGroupViewController: UIViewController {
    
    var currentUser:FirebaseAuth.User!
    let database = Firestore.firestore()
    
    let addGroupScreen = AddGroupScreen()
    
    var users = [String]()
    
    override func loadView() {
        view = addGroupScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "New Group"
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
        
        addGroupScreen.addUserbutton.addTarget(self, action: #selector(onAddUserButtonTapped), for: .touchUpInside)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveGroup))
    }

    // hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
    
    @objc func onAddUserButtonTapped() {
        if let email = addGroupScreen.addUser.text {
            // check that email is not current user's
            if (email.lowercased() != currentUser.email! && !users.contains(email.lowercased())) {
                self.database.collection("users").document(email.lowercased()).getDocument(completion: { (document, error) in
                    // check that email exists in db
                    if let document = document, document.exists {
                        self.users.append(email.lowercased())
                        self.updateUsers()
                    } else {
                        self.showError("\(email.lowercased()) does not exist")
                    }
                })
            } else {
                self.showError("Email cannot be that of current user or is already in the list")
            }
        }
    }
    
    func showError(_ msg: String) {
        let alert = UIAlertController(title: "Error!", message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func updateUsers() {
        var usersString = ""
        for user in users {
            usersString.append("\(user)\n")
        }
        addGroupScreen.users.numberOfLines = users.count + 1
        addGroupScreen.users.text = usersString
        addGroupScreen.addUser.text = ""
    }
}
