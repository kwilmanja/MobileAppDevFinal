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
    
    func generateUUID(task: Task) -> String{
        let joined = task.title + task.group + task.description
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
                group: group.name,
                photoURL: ""
            )
            
            print("sending \(task.title)")
            
            var taskId : String
            
            if let t = self.task{
                taskId = t.id!
            } else{
                taskId = generateUUID(task: task)
            }
            
            do{
                try database.collection("groups")
                    .document(group.id!)
                    .collection("tasks")
                    .document(taskId).setData(from: task)
                print("success!")
                
                self.uploadTaskPhotoToStorage(taskId: taskId, group: group)
                
            } catch let error {
                print("Error sending text: \(error)")
            }
            

        }
        
    }

    
    
}
