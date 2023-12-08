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
    
    init(name: String) {
        self.name = name
    }
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
}
