//
//  TabBarController.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/5/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class TabBarController: UITabBarController {

    
    var handleAuth: AuthStateDidChangeListenerHandle?
    
    let database = Firestore.firestore()

    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                self.signInAlert(msg: "Please sign in to use the app")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }


    
}
