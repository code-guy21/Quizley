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
            //return
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
        
//        let settingsController = UINavigationController(rootViewController: SettingsController())
//        settingsController.tabBarItem.title = "settings"
//        settingsController.tabBarItem.image = UIImage(named: "settings")
        
        let settingListController = SettingListController(collectionViewLayout: layout)
        let navSettingListController = UINavigationController(rootViewController: settingListController)
        navSettingListController.tabBarItem.title = "settings"
        navSettingListController.tabBarItem.image = UIImage(named: "settings")
        
        tabBar.tintColor = .red
        
        viewControllers = [navMyModuleListController,navAddMController,navSettingListController]
    }
    
    func setupTeacherViewControllers() {
        let layout = UICollectionViewFlowLayout()
        let teacherModuleListController = TeacherModuleListController(collectionViewLayout: layout)
        let navTeacherModuleListController = UINavigationController(rootViewController: teacherModuleListController)
        
        navTeacherModuleListController.tabBarItem.title = "play"
        navTeacherModuleListController.tabBarItem.image = UIImage(named: "play")
        
        //let addModuleController2 = UINavigationController(rootViewController: AddModuleController2())
        let teacherAddModuleController = TeacherAddModuleController(collectionViewLayout: layout)
        let navteacherAddModuleController = UINavigationController(rootViewController: teacherAddModuleController)
        navteacherAddModuleController.tabBarItem.title = "add"
        navteacherAddModuleController.tabBarItem.image = UIImage(named: "add")
        
        
//        let settingsController = UINavigationController(rootViewController: TeacherSettingsController())
//        settingsController.tabBarItem.title = "settings"
//        settingsController.tabBarItem.image = UIImage(named: "settings")
        
        let teacherSettingsController = TeacherSettingController(collectionViewLayout: layout)
        let navTeacherSettingsController = UINavigationController(rootViewController: teacherSettingsController)
        navTeacherSettingsController.tabBarItem.title = "settings"
        navTeacherSettingsController.tabBarItem.image = UIImage(named: "settings")
        
        tabBar.tintColor = .red
        
        viewControllers = [navTeacherModuleListController,navteacherAddModuleController,navTeacherSettingsController]
    }
}
