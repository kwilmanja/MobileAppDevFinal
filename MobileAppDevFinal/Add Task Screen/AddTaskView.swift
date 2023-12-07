//
//  AddTaskView.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/6/23.
//

import UIKit

class AddTaskView: UIView {

    
    var textFieldTitle: UITextField!
    var datePicker: UIDatePicker!
    var buttonSelectGroup: UIButton!
    
    var textFieldDescription: UITextField!
    var buttonPhoto: UIButton!

        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        //MARK: initializing the UI elements and constraints...
        
        
        setupTextFieldTitle()
        setupButtonSelectGroup()
        setupTextFieldDescription()
        setupDatePicker()
        setupButtonPhoto()
        
        initConstraints()
    }

    //MARK: initializing the UI elements...

    func setupTextFieldTitle(){
        textFieldTitle = UITextField()
        textFieldTitle.placeholder = "Title"
        textFieldTitle.translatesAutoresizingMaskIntoConstraints = false

        textFieldTitle.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldTitle.frame.height))
        textFieldTitle.leftViewMode = .always
        textFieldTitle.layer.borderWidth = 1.0
        textFieldTitle.layer.borderColor = UIColor.gray.cgColor
        textFieldTitle.layer.cornerRadius = 5.0
        self.addSubview(textFieldTitle)
    }
    
    func setupDatePicker(){
        datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false

        // Set the date picker mode (choose the one that fits your use case)
        datePicker.datePickerMode = .dateAndTime
        
        
        // Set the locale if needed (for example, to display dates in a specific language)
        // datePicker.locale = Locale(identifier: "en_US")
        
        // Set the initial date if needed
        // datePicker.date = Date()
        
        // Add an action to respond to changes in the date picker's value
        // datePicker.addTarget(self, action: #selector(datePickerValueChanged(_:)), for: .valueChanged)
        
        // Add the date picker to your view
        self.addSubview(datePicker)
        
        // Customize the appearance or layout of the date picker as needed
        // datePicker.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        // datePicker.center = view.center
    }
   


    func setupTextFieldDescription(){
        textFieldDescription = UITextField()
        textFieldDescription.placeholder = "Description"
        textFieldDescription.translatesAutoresizingMaskIntoConstraints = false
        textFieldDescription.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldDescription.frame.height))
        textFieldDescription.leftViewMode = .always
        textFieldDescription.layer.borderWidth = 1.0
        textFieldDescription.layer.borderColor = UIColor.gray.cgColor
        textFieldDescription.layer.cornerRadius = 5.0
        textFieldDescription.keyboardType = .emailAddress
        self.addSubview(textFieldDescription)
    }


    func setupButtonSelectGroup(){
        buttonSelectGroup = UIButton(type: .system)
        buttonSelectGroup.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectGroup)
    }

    func setupButtonPhoto(){
        buttonPhoto = UIButton(type: .system)
        buttonPhoto.setTitle("", for: .normal)
        buttonPhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonPhoto.contentHorizontalAlignment = .fill
        buttonPhoto.contentVerticalAlignment = .fill
        buttonPhoto.imageView?.contentMode = .scaleAspectFit
        buttonPhoto.showsMenuAsPrimaryAction = true
        buttonPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonPhoto)
    }



    //MARK: initializing constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 40),
            textFieldTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            buttonSelectGroup.topAnchor.constraint(equalTo: textFieldTitle.bottomAnchor, constant: 16),
            buttonSelectGroup.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            textFieldDescription.topAnchor.constraint(equalTo: buttonSelectGroup.bottomAnchor, constant: 16),
            textFieldDescription.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldDescription.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            datePicker.topAnchor.constraint(equalTo: textFieldDescription.bottomAnchor, constant: 25),
            datePicker.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            
            buttonPhoto.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 25),
            buttonPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonPhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonPhoto.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
