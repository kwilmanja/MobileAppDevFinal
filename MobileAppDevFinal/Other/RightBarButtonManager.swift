////
////  RightBarButtonManager.swift
////  App12
////
////  Created by Sakib Miazi on 6/2/23.
////
//
//import UIKit
//import FirebaseAuth
//
//extension ViewController{
//
//
//
//
//    @objc func onTapOutsideAlert(){
//        self.dismiss(animated: true)
//    }
//
//    @objc func onAddButtonTapped(){
//
////        self.toSettings()
////        self.toTab()
//
//    }
//
//    @objc func toSettings(){
//        let settingsController = SettingsViewController()
//        settingsController.currentUser = self.currentUser
//        navigationController?.pushViewController(settingsController, animated: true)
//    }
//
////    @objc func toTab(){
////        let tabController = TabBarController()
////        navigationController?.pushViewController(tabController, animated: true)
////    }
//
//    func signInToFirebase(email: String, password: String){
//        //MARK: can you display progress indicator here?
//        //MARK: authenticating the user...
//        Auth.auth().signIn(withEmail: email, password: password, completion: {(result, error) in
//            if error == nil{
//                //MARK: user authenticated...
//                //MARK: can you hide the progress indicator here?
//            }else{
//                //MARK: alert that no user found or password wrong...
//            }
//
//        })
//    }
//
//}
//
