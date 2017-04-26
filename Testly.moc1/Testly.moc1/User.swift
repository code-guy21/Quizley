//
//  User.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/13/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import Foundation

struct User {
    let uid: String
    let username: String
    let access: String
    let name: String
    let phone: String
    let email: String
    let password: String
    
    init(uid:String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.access = dictionary["access"] as? String ?? ""
        self.name = dictionary["name"] as? String ?? ""
        self.phone = dictionary["phone"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.password = dictionary["password"] as? String ?? ""
        
    }
}
