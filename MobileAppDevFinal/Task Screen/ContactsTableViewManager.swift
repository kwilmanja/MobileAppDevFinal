//
//  ContactsTableViewManager.swift
//  App12
//
//  Created by Sakib Miazi on 6/2/23.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Configs.tableViewContactsID, for: indexPath) as! UserTableViewCell
        
        let t = contactsList[indexPath.row]
                
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/y"
        let formattedDate = dateFormatter.string(from: t.date.dateValue())
        
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let formattedTime = dateFormatter.string(from: t.date.dateValue())

        cell.name.text = t.title
        cell.email.text = "\(formattedDate) - \(formattedTime)"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = self.contactsList[indexPath.row]
        let taskViewController = TaskViewController()
        taskViewController.task = task
        taskViewController.currentUser = self.currentUser
        taskViewController.groups = self.groups
        navigationController?.pushViewController(taskViewController, animated: true)
    }
    
}
