//
//  GetTaskManager.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/6/23.
//

import Foundation
import FirebaseFirestore


extension ViewController {
    
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
                    
                  for document in querySnapshot!.documents {
                      do{
                          let g  = try document.data(as: Group.self)
                          self.groups.append(g)
                      }catch{
                          print(error)
                      }
                  }
                }
            }
    }
    
    func populateTasks() {
        self.tasksList.removeAll()
        
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
                    
                    self.getTasks(groupIds: groups)
                }
              }
        
    }
    
    func getTasks(groupIds: [String]){
        
        for groupId in groupIds {
            
            self.database.collection("groups")
                .document(groupId)
                .collection("tasks").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                      print("Error getting documents: \(err)")
                    } else {
                        
                      for document in querySnapshot!.documents {
                              do{
                                  let task  = try document.data(as: Task.self)
                                  self.tasksList.append(task)
                                  print(task.title)
                              }catch{
                                  print(error)
                              }
                          }
                        self.tasksList.sort(by: { $0.date.seconds < $1.date.seconds})
                        self.mainScreen.tableViewTasks.reloadData()
                    }
                  }
            
        }
        


    
    }
    
}
