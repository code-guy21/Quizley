//
//  CustomTabBarController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import Firebase

class CustomTabBarConroller: UITabBarController,UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        if FIRAuth.auth()?.currentUser == nil {
            
            DispatchQueue.main.async {
                
                let loginRegisterController = LoginRegisterController()
                // this is be the native nav contrller does not excist
                // in loginController so we have to add it functionallty by doing this
                let navController = UINavigationController(rootViewController: loginRegisterController)
                self.present(navController, animated: true, completion: nil)
                
            }
            return
        }
        
        fetchUser()
            
    }
    var user: User?
    var access: String?
    
    fileprivate func fetchUser() {
        
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {return}
        FIRDatabase.fetchUserWithUID(uid: uid) { (user) in
            self.user = user
            self.access = user.access
            if(self.access == "student") {
                self.setupStudentViewControllers()
            }
            else if(self.access == "teacher"){
                self.setupTeacherViewControllers()
            }
        }
    }
    

     func setupStudentViewControllers() {
        let layout = UICollectionViewFlowLayout()
        let myModuleListController = MyModuleListController(collectionViewLayout: layout)
        let navMyModuleListController = UINavigationController(rootViewController: myModuleListController)
        
        navMyModuleListController.tabBarItem.title = "play"
        navMyModuleListController.tabBarItem.image = UIImage(named: "play")
        
        let addMController = AddMController(collectionViewLayout: layout)
        let navAddMController = UINavigationController(rootViewController: addMController)
        
        navAddMController.tabBarItem.title = "add"
        navAddMController.tabBarItem.image = UIImage(named: "add")
        
        let settingsController = UINavigationController(rootViewController: SettingsController())
        settingsController.tabBarItem.title = "settings"
        settingsController.tabBarItem.image = UIImage(named: "settings")
        
        tabBar.tintColor = .red
        
        viewControllers = [navMyModuleListController,navAddMController,settingsController]
    }
    
    func setupTeacherViewControllers() {
        
        let addModuleController2 = UINavigationController(rootViewController: AddModuleController2())
        addModuleController2.tabBarItem.title = "add"
        addModuleController2.tabBarItem.image = UIImage(named: "add")
        
        let settingsController = UINavigationController(rootViewController: SettingsController())
        settingsController.tabBarItem.title = "settings"
        settingsController.tabBarItem.image = UIImage(named: "settings")
        
        tabBar.tintColor = .red
        
        viewControllers = [addModuleController2,settingsController]
    }
}
