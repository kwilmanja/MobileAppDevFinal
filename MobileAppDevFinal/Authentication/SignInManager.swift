//
//  SignInManager.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/5/23.
//

import Foundation
import UIKit
import FirebaseAuth

extension TabBarController{
    
    
    @objc func signInAlert(msg: String){
        let signInAlert = UIAlertController(
            title: "Sign In / Register",
            message: msg,
            preferredStyle: .alert)
        
        //MARK: setting up email textField in the alert...
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter email"
            textField.contentMode = .center
            textField.keyboardType = .emailAddress
        }
        
        //MARK: setting up password textField in the alert...
        signInAlert.addTextField{ textField in
            textField.placeholder = "Enter password"
            textField.contentMode = .center
            textField.isSecureTextEntry = true
        }
        
        //MARK: Sign In Action...
        let signInAction = UIAlertAction(title: "Sign In", style: .default, handler: {(_) in
            if let email = signInAlert.textFields![0].text,
               let password = signInAlert.textFields![1].text{
                //MARK: sign-in logic for Firebase...
                self.signIn(email: email, password: password)
            }
        })
        
        //MARK: Register Action...
        let registerAction = UIAlertAction(title: "Register", style: .default, handler: {(_) in
            //MARK: logic to open the register screen...
            self.registerAlert(msg: "Please register to use the app")

        })
        
        
        //MARK: action buttons...
        signInAlert.addAction(signInAction)
        signInAlert.addAction(registerAction)
        
        self.present(signInAlert, animated: true, completion: {() in
            //MARK: hide the alerton tap outside...
            signInAlert.view.superview?.isUserInteractionEnabled = true
        })
    }
    
    
    func signIn(email: String, password: String) {
        
        if self.isValidEmail(email) {
            // sign in via firebase
            Auth.auth().signIn(withEmail: email, password: password, completion: { (result, error) in
                if error == nil {
                    // user authenticated, hide progress bar
                } else {
                    // show login error
                    self.signInAlert(msg: "No user is found or password is incorrect.")
                }
            })
        } else {
            self.signInAlert(msg: "The email is invalid!")
        }
    }
    
    func isValidEmail(_ email:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: email)
    }

    
}
