//
//  AddModuleDatasource.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents
import Firebase

//makes the HomeDatasource (Jframe)
class SelectModuleDatasource: Datasource {
    
//    let addBasicModules: [Module] = {
//        
//        
//        let moduleArt = Module(name: "Art",status: "Lets paint",moduleImage: #imageLiteral(resourceName: "art"))
//        
//        let moduleMath = Module(name: "Math",status: "Lets learn Math",moduleImage: #imageLiteral(resourceName: "math"))
//        
//        let moduleHistory = Module(name: "History",status: "Lets learn History",moduleImage: #imageLiteral(resourceName: "history"))
//        
//        return [moduleArt,moduleMath,moduleHistory]
//    }()
    
    let addCompModules: [Module2] = {
        
        
        let moduleCop4030 = Module2(name: "Cop3512",status: "UCF Computer Science I ",moduleImage:#imageLiteral(resourceName: "school") )
        
        let moduleCop4020 = Module2(name: "Cop4020",status: "UCF Programming Languages",moduleImage: #imageLiteral(resourceName: "school"))
        
        let moduleCop1000 = Module2(name: "Cop1000",status: "UCF Intro to C",moduleImage: #imageLiteral(resourceName: "school"))
        
        return [moduleCop4030, moduleCop4020, moduleCop1000]
    }()
    
    var ref: FIRDatabaseReference?
    var databaseHandle: FIRDatabaseHandle?
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
        return [ModuleCell.self, Module2Cell.self]
    }
    
    //number of cells
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return addCompModules.count
        }
        print("nhfdkjshfkjdshfkjhsde",modules.count)
        return modules.count
        
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    //move words to cell from array
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return addCompModules[indexPath.item]
        }
        return modules[indexPath.item]
    }
    
    
    var user: User?
    var modules = [Module]()
    func fetchModules()
    {
//        //our classes
//        let uid = "fochXH9eJsY3Ek5CY7Agunxy4Bw2"
//        FIRDatabase.fetchUserWithUID(uid: uid) { (user) in
//            self.user = user
//            self.ref = FIRDatabase.database().reference().child("modules").child(uid)
//            
//                self.ref?.queryOrdered(byChild: "A1").observe(.childAdded, with: { (snapshot) in
//
//            
//            print(snapshot.value)
//               guard let dictionary = snapshot.value as? [String: Any] else { return }
//                
//               let module = Module(dictionary: dictionary)
//               self.modules.insert(module, at: self.modules.count-1)
//                
//            }) { (err) in
//                print("Failed to fetch ordered Modules:", err)
//            }
//            
    }
}



    
