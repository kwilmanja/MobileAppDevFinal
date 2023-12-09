//
//  AddGroupScreen.swift
//  MobileAppDevFinal
//
//  Created by Andrew Liu on 12/8/23.
//

import UIKit

class AddGroupScreen: UIView {

    var name: UITextField!
    var addUser: UITextField!
    var addUserbutton: UIButton!
    var usersLabel: UILabel!
    var users: UILabel!

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        setupName()
        setupaddUser()
        setupUsersLabel()
        setupAddUserbutton()
        setupUsers()
        
        initConstraints()
    }
    
    func setupName() {
        name = UITextField()
        name.placeholder = "Name"
        name.keyboardType = .default
        name.borderStyle = .roundedRect
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
    }
    
    func setupaddUser() {
        addUser = UITextField()
        addUser.placeholder = "Add User by Email"
        addUser.keyboardType = .emailAddress
        addUser.borderStyle = .roundedRect
        addUser.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addUser)
    }
    
    func setupAddUserbutton() {
        addUserbutton = UIButton(type: .system)
        addUserbutton.setTitle("Add User", for: .normal)
        addUserbutton.showsMenuAsPrimaryAction = true
        addUserbutton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(addUserbutton)
    }
    
    func setupUsersLabel() {
        usersLabel = UILabel()
        usersLabel.text = "Users:"
        usersLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(usersLabel)
    }
    
    func setupUsers() {
        users = UILabel()
        users.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(users)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            name.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            name.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            name.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            addUser.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            addUser.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            addUser.widthAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.widthAnchor),
            
            addUserbutton.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            addUserbutton.leadingAnchor.constraint(equalTo: addUser.trailingAnchor, constant: 8),
            addUserbutton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            usersLabel.topAnchor.constraint(equalTo: addUser.bottomAnchor, constant: 16),
            usersLabel.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            usersLabel.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            
            users.topAnchor.constraint(equalTo: usersLabel.bottomAnchor, constant: 16),
            users.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            users.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
