//
//  TaskView.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/6/23.
//

import UIKit

class TaskView: UIView {
    
    var contentWrapper:UIScrollView!
    
    var labelDescription: UILabel!
    var labelGroup: UILabel!
    var labelDate: UILabel!
    var taskPic: UIImageView!
    var buttonDelete: UIButton!


        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        
        setupContentWrapper()
        
        setupDescription()
        setupGroup()
        setupDate()
        setupImage()
        setupButtonDelete()
        
        initConstraints()
    }
    
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }


    func setupDescription() {
        labelDescription = UILabel()
        labelDescription.font = UIFont.systemFont(ofSize: 15)
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelDescription)
    }
    
    func setupGroup() {
        labelGroup = UILabel()
        labelGroup.font = UIFont.boldSystemFont(ofSize: 20)
        labelGroup.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelGroup)
    }
    
    func setupDate() {
        labelDate = UILabel()
        labelDate.font = UIFont.boldSystemFont(ofSize: 20)
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(labelDate)
    }
    
    func setupImage(){
        taskPic = UIImageView()
        taskPic.contentMode = .scaleToFill
        taskPic.clipsToBounds = true
        taskPic.layer.cornerRadius = 10
        taskPic.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(taskPic)
    }
    
    func setupButtonDelete(){
        buttonDelete = UIButton(type: .system)
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        buttonDelete.setTitle("Delete", for: UIControl.State.normal)
        contentWrapper.addSubview(buttonDelete)
    }
    
    


    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.trailingAnchor.constraint(equalTo:self.safeAreaLayoutGuide.trailingAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),

            labelGroup.topAnchor.constraint(equalTo: contentWrapper.topAnchor, constant: 16),
            labelGroup.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            labelDate.topAnchor.constraint(equalTo: labelGroup.bottomAnchor, constant: 16),
            labelDate.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            labelDescription.topAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 16),
            labelDescription.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            buttonDelete.topAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 8),
            buttonDelete.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            taskPic.topAnchor.constraint(equalTo: buttonDelete.bottomAnchor, constant: 8),
            taskPic.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            taskPic.heightAnchor.constraint(equalToConstant: 500),
            taskPic.widthAnchor.constraint(equalToConstant: 300)
            
            
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
