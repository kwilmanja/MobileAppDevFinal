//
//  RegisterManager.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/5/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension TabBarController{
    
    @objc func registerAlert(msg: String){
        let registerAlert = UIAlertController(
            title: "Register",
            message: msg,
            preferredStyle: .alert)
        
        //MARK: setting up email textField in the alert...
        registerAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        registerAlert.addTextField{ textField in
            textField.placeholder = "Enter name"
            textField.contentMode = .center
        }
        
        //MARK: setting up password textField in the alert...
        registerAlert.addTextField{ textField in
            textField.placeholder = "Enter password"
            textField.contentMode = .center
            textField.isSecureTextEntry = true
        }
        
        registerAlert.addTextField{ textField in
            textField.placeholder = "Confirm password"
            textField.contentMode = .center
            textField.isSecureTextEntry = true
        }
        
        //MARK: Sign In Action...
        let registerAction = UIAlertAction(title: "Register", style: .default, handler: {(_) in
            if let email = registerAlert.textFields![0].text,
               let name = registerAlert.textFields![1].text,
               let password = registerAlert.textFields![2].text,
               let passwordConfirmed = registerAlert.textFields![3].text
            {
                //MARK: sign-in logic for Firebase...
                if(password == passwordConfirmed){
                    self.register(email: email, name: name, password: password)
                } else{
                    self.registerAlert(msg: "Passwords did not match")
                }
            }
        })
        
        //MARK: Register Action...
        let signInAction = UIAlertAction(title: "Sign In", style: .default, handler: {(_) in
            //MARK: logic to open the register screen...
            self.signInAlert(msg: "Please sign in to use the app")
        })
        
        
        //MARK: action buttons...
        registerAlert.addAction(registerAction)
        registerAlert.addAction(signInAction)
        
        self.present(registerAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            registerAlert.view.superview?.isUserInteractionEnabled = true
        })
    }
    
    func register(email: String, name: String, password: String){
        //MARK: display the progress indicator...
        //MARK: create a Firebase user with email and password...
        //Validations....
        Auth.auth().createUser(withEmail: email, password: password, completion: {result, error in
            if error == nil{
                //MARK: the user creation is successful...
                self.setNameOfTheUserInFirebaseAuth(name: name, email: email)
            }else{
                //MARK: there is a error creating the user...
                self.registerAlert(msg: error!.localizedDescription)
            }
        })
        
    }
    
    //MARK: We set the name of the user after we create the account...
    func setNameOfTheUserInFirebaseAuth(name: String, email:String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = name
        changeRequest?.commitChanges(completion: {(error) in
            if error == nil{
                //MARK: the profile update is successful...
                let user = User(name: name)
                self.addUserToFirestore(user: user, email: email)
            }else{
                //MARK: there was an error updating the profile...
                print("Error occured: \(String(describing: error))")
            }
        })
    }
    
    func addUserToFirestore(user:User, email:String) {
        do {
            try self.database.collection("users").document(email.lowercased()).setData(from: user, completion: {(error) in
                if error == nil {
                    
                }
            })
        } catch {
            print("Error in adding new user to Firestore!")
        }
    }

    
}
