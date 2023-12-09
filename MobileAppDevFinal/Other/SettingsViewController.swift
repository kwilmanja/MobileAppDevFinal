//
//  SettingsViewController.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/5/23.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    let settingsScreen = SettingsView()
    
    var currentUser:FirebaseAuth.User?
    
    var handleAuth: AuthStateDidChangeListenerHandle?


    let notificationCenter = NotificationCenter.default

    override func loadView() {
        view = settingsScreen
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //MARK: handling if the Authentication state is changed (sign in, sign out, register)...
        handleAuth = Auth.auth().addStateDidChangeListener{ auth, user in
            if user == nil{
                //MARK: Reset tableView...
                self.settingsScreen.labelName.text = ""
                self.settingsScreen.labelEmail.text = ""
                
            }else{
                //MARK: the user is signed in...
                self.settingsScreen.labelName.text = user!.displayName ?? ""
                self.settingsScreen.labelEmail.text = user!.email!
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        
        self.settingsScreen.buttonLogout.addTarget(self, action: #selector(logout), for: .touchUpInside)
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handleAuth!)
    }
    

    @objc func logout(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                    self.settingsScreen.labelName.text = ""
                    self.settingsScreen.labelEmail.text = ""
                }catch{
                    print("Error occured!")
                }
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        self.present(logoutAlert, animated: true)
        
        
    }

}
