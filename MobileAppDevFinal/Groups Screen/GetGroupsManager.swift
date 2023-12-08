//
//  GetGroupsManager.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/6/23.
//

import Foundation
import FirebaseFirestore

extension GroupsViewController {
    
    func populateGroups(){
        self.database.collection("users")
            .document((self.currentUser?.email)!)
            .collection("groups").getDocuments() { (querySnapshot, err) in
                if let err = err {
                  print("Error getting documents: \(err)")
                } else {
                    var groups = [String]()
                    
                    for document in querySnapshot!.documents {
                    groups.append(document.documentID)
                    print("\(document.documentID)")
                    }
                    
                    self.getGroups(groupIds: groups)
                }
            }
    }
    
    
    func getGroups(groupIds: [String]) {
        self.database.collection("groups")
            .whereField(FieldPath.documentID(), in: groupIds)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                  print("Error getting documents: \(err)")
                } else {
                    self.groupsList.removeAll()
                    
                    for document in querySnapshot!.documents {
                      do{
                          let g  = try document.data(as: Group.self)
                          self.groupsList.append(g)
                      }catch{
                          print(error)
                      }
                    }
                    self.groupScreen.tableViewGroups.reloadData()
                }
            }
    }
}
