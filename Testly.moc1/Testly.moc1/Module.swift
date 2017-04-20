//
//  Module.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit

struct Module {
    let mId: String
    let className:String
    let classCaption: String
    let moduleImage: UIImage
    
    init(mId:String, dictionary: [String:Any]) {
        self.mId = mId
        self.className = dictionary["ClassName"] as? String ?? ""
        self.classCaption = dictionary["ClassCaption"] as? String ?? ""
        self.moduleImage = #imageLiteral(resourceName: "school")
    }
}
