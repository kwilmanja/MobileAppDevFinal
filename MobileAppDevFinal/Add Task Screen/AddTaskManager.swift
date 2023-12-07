//
//  AddTaskManager.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/6/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import CryptoKit


extension AddTaskViewController{
    
    func generateUUID(title: String, email: String) -> String{
        let joined = title + email
        let joinedData = Data(joined.utf8)
        let hashed = Insecure.MD5.hash(data: joinedData)
        return hashed.compactMap{String(format: "%02x", $0)}.joined()
        
    }
    
    
    @objc func saveTask(){

        //pickedImage
        //selectedGroup
        
        if let title = addTaskScreen.textFieldTitle.text,
            let group = selectedGroup {
                        
            let task = Task(
                title: title,
                description: addTaskScreen.textFieldDescription.text ?? "",
                date: Timestamp(date: addTaskScreen.datePicker.date),
                group: group.name
            )
            
            
            print("sending \(task.title)")
            
            if let t = self.task{
                do {
                    try database.collection("groups")
                        .document(group.id!)
                        .collection("tasks")
                        .document(t.id!).setData(from: task)
                    print("success!")
                    self.navigationController?.popViewController(animated: true)
                } catch let error {
                    print("Error sending text: \(error)")
                }
            } else{
                do {
                    try database.collection("groups")
                        .document(group.id!)
                        .collection("tasks")
                        .document().setData(from: task)
                    print("success!")
                    self.navigationController?.popViewController(animated: true)
                    self.navigationController?.popViewController(animated: true)

                    
                } catch let error {
                    print("Error sending text: \(error)")
                }
            }
            

        }
        
    }
    
    
}
