//
//  UserTableViewCell.swift
//  WA8_13
//
//  Created by Andrew Liu on 11/18/23.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    var wrapperCellView: UIView!
    var title: UILabel!
    var dueDate: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupWrapperCellView()
        setupTitle()
        setupDueDate()
        
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        
        //working with the shadows and colors...
        wrapperCellView.backgroundColor = .white
        wrapperCellView.layer.cornerRadius = 6.0
        wrapperCellView.layer.shadowColor = UIColor.gray.cgColor
        wrapperCellView.layer.shadowOffset = .zero
        wrapperCellView.layer.shadowRadius = 4.0
        wrapperCellView.layer.shadowOpacity = 0.4
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(wrapperCellView)
    }
    
    func setupTitle() {
        title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 20)
        title.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(title)
    }
    
    func setupDueDate() {
        dueDate = UILabel()
        dueDate.font = UIFont.systemFont(ofSize: 15)
        dueDate.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(dueDate)
    }
    
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            title.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 5),
            title.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            title.heightAnchor.constraint(equalToConstant: 20),
            title.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            dueDate.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5),
            dueDate.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 16),
            dueDate.heightAnchor.constraint(equalToConstant: 15),
            dueDate.widthAnchor.constraint(lessThanOrEqualTo: wrapperCellView.widthAnchor),
            
            wrapperCellView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
