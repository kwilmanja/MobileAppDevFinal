//
//  GroupViewController.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/5/23.
//

import UIKit

class GroupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "Group Page"
        label.sizeToFit()
        label.center = view.center
        view.addSubview(label)

        // Set the title for the tab
        title = "Groups"
    }

}
