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
        
        

        self.settingsScreen.labelName.text = currentUser?.displayName!
        self.settingsScreen.labelEmail.text = currentUser?.email!

        // Do any additional setup after loading the view.
    }
    

    func logout(){
        let logoutAlert = UIAlertController(title: "Logging out!", message: "Are you sure want to log out?", preferredStyle: .actionSheet)
        logoutAlert.addAction(UIAlertAction(title: "Yes, log out!", style: .default, handler: {(_) in
                do{
                    try Auth.auth().signOut()
                }catch{
                    print("Error occured!")
                }
            })
        )
        logoutAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        self.present(logoutAlert, animated: true)
    }

}
