//
//  GetPhotoManager.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/8/23.
//

import Foundation
import UIKit

extension AddTaskViewController{
   
    func loadRemoteImage(from urlString: String){
        
        let url = URL(string: urlString)!

        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self!.addTaskScreen.buttonPhoto.setImage(image, for: .normal)
                    }
                }
            }
        }
    }
    
}
