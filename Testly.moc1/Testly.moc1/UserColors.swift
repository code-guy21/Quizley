//
//  File.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/22/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit

struct UserColors {
    let cellColor: UIColor
    let navColor: UIColor
    let darkColor: UIColor
    let logo: UIImage
    let access: String
    
    init(access: String) {
        
        if(access == "teacher") {
            cellColor = UIColor(r: 245, g: 224, b: 229)
            navColor = UIColor(r: 176, g: 21, b: 55)
            darkColor = UIColor(r: 156, g: 36, b: 80)
            logo = #imageLiteral(resourceName: "logoblue")
            self.access = access
        } else if(access == "student") {
            cellColor = UIColor(r: 201, g: 224, b: 255)
            navColor = UIColor(r: 0, g: 180, b: 248)
            darkColor = UIColor(r: 51, g: 105, b: 255)
            logo = #imageLiteral(resourceName: "logored")
            self.access = access
        }
        
        else {
            cellColor = .white
            navColor = .white
            darkColor = .white
            logo = #imageLiteral(resourceName: "next")
            self.access = access
        }
    }
}
