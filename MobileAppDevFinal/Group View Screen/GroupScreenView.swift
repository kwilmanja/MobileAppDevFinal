//
//  GroupScreenView.swift
//  MobileAppDevFinal
//
//  Created by Andrew Liu on 12/8/23.
//

import UIKit

class GroupScreenView: UIView {

    var contentWrapper:UIScrollView!
    var name: UILabel!
    var usersLabel: UILabel!
    var users: UILabel!
    var buttonDelete: UIButton!

    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupContentWrapper()
        
        setupName()
        setupUsersLabel()
        setupUsers()
        setupButtonDelete()
        
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupName() {
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(name)
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
    
    func setupButtonDelete(){
        buttonDelete = UIButton(type: .system)
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        buttonDelete.setTitle("Delete", for: UIControl.State.normal)
        contentWrapper.addSubview(buttonDelete)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            name.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 16),
            name.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            name.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.9),
            
            usersLabel.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            usersLabel.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            usersLabel.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.9),
            
            users.topAnchor.constraint(equalTo: usersLabel.bottomAnchor, constant: 16),
            users.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            users.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor, multiplier: 0.9),
            
            buttonDelete.topAnchor.constraint(equalTo: users.bottomAnchor, constant: 8),
            buttonDelete.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonDelete.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
