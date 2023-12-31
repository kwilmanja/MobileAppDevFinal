//
//  GroupTableViewManager.swift
//  MobileAppDevFinal
//
//  Created by Andrew Liu on 12/8/23.
//

import Foundation
import UIKit

extension GroupsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewGroupsID, for: indexPath) as! GroupTableViewCell
        
        let g = groupsList[indexPath.row]

        cell.title.text = g.name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = self.groupsList[indexPath.row]
        
        let groupViewController = GroupViewController()
        groupViewController.group = group
        groupViewController.currentUser = self.currentUser
        navigationController?.pushViewController(groupViewController, animated: true)
    }
}
