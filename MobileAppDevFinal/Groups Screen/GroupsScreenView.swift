//
//  GroupScreensView.swift
//  MobileAppDevFinal
//
//  Created by Andrew Liu on 12/8/23.
//

import UIKit

class GroupsScreenView: UIView {

    var tableViewGroups: UITableView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        // initializing a TableView
        setupTableViewGroups()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableViewGroups() {
        tableViewGroups = UITableView()
        tableViewGroups.translatesAutoresizingMaskIntoConstraints = false
        tableViewGroups.register(GroupTableViewCell.self, forCellReuseIdentifier: Configs.tableViewGroupsID)
        self.addSubview(tableViewGroups)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            tableViewGroups.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewGroups.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewGroups.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tableViewGroups.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }
}
