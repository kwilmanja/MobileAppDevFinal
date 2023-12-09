//
//  AddGroupManager.swift
//  MobileAppDevFinal
//
//  Created by Andrew Liu on 12/8/23.
//

import Foundation
import FirebaseFirestore

extension AddGroupViewController {
    @objc func saveGroup() {
        if let name = addGroupScreen.name.text {
            do {
                var ref:DocumentReference
                if let g = self.group{
                    ref = self.database.collection("groups").document(g.id!)
                } else {
                    ref = self.database.collection("groups").document()
                }
                
                // https://stackoverflow.com/questions/63478433/how-to-get-document-id-after-creation-firestore-ios
//                let ref = self.database.collection("groups").document()
                
                try ref.setData(from: Group(name: name, users: self.users), completion: { error in
                    if error == nil {
                        // add group to current user
                        self.addGroupToUser(email: self.currentUser.email!, id: ref.documentID)
                        
                        // add group to shared users
                        for user in self.users {
                            self.addGroupToUser(email: user, id: ref.documentID)
                        }
                        
                        self.goBackToMainPage()
                    }
                })
                
            } catch {
                print("Error in saving new group")
            }
        }
    }
    
    func addGroupToUser(email:String, id:String) {
        self.database.collection("users").document(email).collection("groups").document(id).setData([:])
    }
}
