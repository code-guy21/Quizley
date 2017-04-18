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
    
    init(uid:String, dictionary: [String: Any]) {
        self.uid = uid
        self.username = dictionary["username"] as? String ?? ""
        self.access = dictionary["access"] as? String ?? ""
        
    }
}
