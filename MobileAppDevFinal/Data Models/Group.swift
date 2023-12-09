//
//  Group.swift
//  MobileAppDevFinal
//
//  Created by Joph Kwilman on 12/6/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Group: Codable{
    @DocumentID var id: String?
    var name: String
    var users: [String]
    
    init(name: String, users:[String]) {
        self.name = name
        self.users = users
    }
    
    init(id: String, name: String, users:[String]) {
        self.id = id
        self.name = name
        self.users = users
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case users
    }
    
}
