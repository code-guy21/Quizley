//
//  AddModuleDatasource.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents


//makes the HomeDatasource (Jframe)
class SelectModuleDatasource: Datasource {
    
    let addBasicModules: [Module] = {
        
        
        let moduleArt = Module(name: "Art",status: "Lets paint",moduleImage: #imageLiteral(resourceName: "art"))
        
        let moduleMath = Module(name: "Math",status: "Lets learn Math",moduleImage: #imageLiteral(resourceName: "math"))
        
        let moduleHistory = Module(name: "History",status: "Lets learn History",moduleImage: #imageLiteral(resourceName: "history"))
        
        return [moduleArt,moduleMath,moduleHistory]
    }()
    
    let addComModules: [Module] = {
        
        
        let moduleCop4030 = Module(name: "Cop3512",status: "UCF Computer Science I ",moduleImage:#imageLiteral(resourceName: "school") )
        
        let moduleCop4020 = Module(name: "Cop4020",status: "UCF Programming Languages",moduleImage: #imageLiteral(resourceName: "school"))
        
        let moduleCop1000 = Module(name: "Cop1000",status: "UCF Intro to C",moduleImage: #imageLiteral(resourceName: "school"))
        
        return [moduleCop4030, moduleCop4020, moduleCop1000]
    }()
    
    //what type of footer
        override func footerClasses() -> [DatasourceCell.Type]? {
            return [SelectBasicModuleFooter.self]
        }
    
    //what type of header
        override func headerClasses() -> [DatasourceCell.Type]? {
            return [SelectBasicModuleHeader.self,SelectCompModuleHeader.self]
        }
    
    //what type of cells
    override func cellClasses() -> [DatasourceCell.Type] {
        return [ModuleCell.self, ModuleCell.self]
    }
    
    //number of cells
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return addComModules.count
        }
        return addBasicModules.count
        
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    //move words to cell from array
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return addComModules[indexPath.item]
        }
        return addBasicModules[indexPath.item]
    }
        
}

    
