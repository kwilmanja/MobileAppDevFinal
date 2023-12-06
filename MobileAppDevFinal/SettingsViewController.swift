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

    let notificationCenter = NotificationCenter.default

    override func loadView() {
        view = settingsScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Settings"
        
        if let user = Auth.auth().currentUser {
            self.settingsScreen.labelName.text = user.displayName!
            self.settingsScreen.labelEmail.text = user.email!
        }
        
        self.settingsScreen.buttonLogout.addTarget(self, action: #selector(logout), for: .touchUpInside)
        

        // Do any additional setup after loading the view.
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
