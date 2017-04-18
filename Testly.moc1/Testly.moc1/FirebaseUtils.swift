//
//  FirebaseUtils.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/13/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import Firebase

extension FIRDatabase {
    
    static func fetchUserWithUID(uid: String, completion: @escaping (User) -> ()) {
        FIRDatabase.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
            
            guard let userDictionary = snapshot.value as? [String: Any] else { return }
            
            let user = User(uid: uid, dictionary: userDictionary)
            
            completion(user)
            
        }) { (err) in
            print("Failed to fetch user for post", err)
        }
    }
}
