//
//  AddTaskPhotoManager.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/8/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage
import CryptoKit


extension AddTaskViewController{
    
    
    func uploadTaskPhotoToStorage(taskId : String, group: Group) {

            //MARK: Upload the profile photo if there is any...
            if let image = pickedImage{
                if let jpegData = image.jpegData(compressionQuality: 80){
                    let storageRef = storage.reference()
                    let imagesRepo = storageRef.child("imagesTasks")
                    let imageRef = imagesRepo.child("\(taskId).jpg")

                    imageRef.putData(jpegData, completion: {(metadata, error) in
                        if error == nil{
                            imageRef.downloadURL(completion: {(url, error) in
                                if error == nil{
                                    let photoURL = "\(String(describing: url!))"
                                    print(photoURL)
                                    self.database.collection("groups")
                                        .document(group.id!)
                                        .collection("tasks")
                                        .document(taskId).updateData([
                                            "photoURL": photoURL
                                          ]) { err in
                                            if let err = err {
                                              print("Error updating document: \(err)")
                                            } else {
                                              print("Document successfully updated")
                                                self.goBackToMainPage()
                                            }
                                          }
                                    
                                }
                            })
                        }
                    })
                }
            } else{
                self.goBackToMainPage()
            }
    }
    
    func goBackToMainPage(){
        if let _ = self.task{
            self.navigationController?.popViewController(animated: true)
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
