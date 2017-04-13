//
//  Moduled.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import Foundation


import LBTAComponents


//makes the HomeDatasource (Jframe)
class ModuleDatasource: Datasource {
    
    let modules: [Module] = {
        
        let moduleMath = Module(name: "Math",status: "Lets learn Math",moduleImage: #imageLiteral(resourceName: "math"))
        
        let moduleHistory = Module(name: "History",status: "Lets learn History",moduleImage: #imageLiteral(resourceName: "history"))
        
        return [moduleMath,moduleHistory]
    }()
    
    //what type of footer
    //    override func footerClasses() -> [DatasourceCell.Type]? {
    //        return [UserFooter.self]
    //    }
    
    //what type of header
        override func headerClasses() -> [DatasourceCell.Type]? {
            return [ListHeader.self]
        }
    
    //what type of cells
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ModuleCell.self]
    }
    
    //number of cells
    override func numberOfItems(_ section: Int) -> Int {
        return modules.count
        
    }
    
    override func numberOfSections() -> Int {
        return 1
    }
    
    //move words to cell from array
    override func item(_ indexPath: IndexPath) -> Any? {
        return modules[indexPath.item]
        
    }
    
    
    
}
