//
//  SettingsDatasource.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/9/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents
import FirebaseDatabase

//makes the HomeDatasource (Jframe)
class SettingsDatasource: Datasource {
    
    
    let settings: [Settings] = {
        
        let Name = Settings(type: "Name", UserInput: "Miguel Chavez", typeImage: #imageLiteral(resourceName: "name"))
        let UserName = Settings(type: "UserName", UserInput: "chavezucf", typeImage: #imageLiteral(resourceName: "userNam"))
        let Birthday = Settings(type: "Birthday", UserInput: "7/9/1994", typeImage: #imageLiteral(resourceName: "birthday"))
        let PhoneNum = Settings(type: "Phone Number", UserInput: "850.496.1538", typeImage: #imageLiteral(resourceName: "phoneNum"))
        let Email = Settings(type: "Email", UserInput: "mac3@knights.ucf.edu", typeImage: #imageLiteral(resourceName: "email"))
        let Password = Settings(type: "Password", UserInput: "********", typeImage: #imageLiteral(resourceName: "password"))
        
        
        return [Name,UserName,Birthday,PhoneNum,Email,Password]
    }()
    
    //what type of footer
    //    override func footerClasses() -> [DatasourceCell.Type]? {
    //        return [UserFooter.self]
    //    }
    
    //what type of header
    //    override func headerClasses() -> [DatasourceCell.Type]? {
    //        return [ModuleHeader.self]
    //   }
    
    //what type of cells
    override func cellClasses() -> [DatasourceCell.Type] {
        return [SettingsCell.self]
    }
    
    //number of cells
    override func numberOfItems(_ section: Int) -> Int {
        return settings.count
        
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    //move words to cell from array
    override func item(_ indexPath: IndexPath) -> Any? {
        return settings[indexPath.item]
        
    }
    
    
    
}
