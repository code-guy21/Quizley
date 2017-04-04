//
//  SharedModuleData.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/16/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit

final class SharedModuleData {
    static let shared = SharedModuleData() //lazy init, and it only runs once
    
    var name = "Math"
    var status = "Lets learn Math"
    var moduleImage = #imageLiteral(resourceName: "math")
}
