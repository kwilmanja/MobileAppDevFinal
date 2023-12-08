//
//  Task.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/6/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Task: Codable{
    @DocumentID var id: String?
    var title: String
    var description: String
    var date: Timestamp
    var group: String
    var photoURL: String
    
    init(title: String, description: String, date: Timestamp, group: String, photoURL: String) {
        self.title = title
        self.description = description
        self.date = date
        self.group = group
        self.photoURL = photoURL
    }
    
    
    init(id: String, title: String, description: String, date: Timestamp, group: String, photoURL: String) {
        self.id = id
        self.title = title
        self.description = description
        self.date = date
        self.group = group
        self.photoURL = photoURL
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case date
        case group
        case photoURL
    }
    
}


