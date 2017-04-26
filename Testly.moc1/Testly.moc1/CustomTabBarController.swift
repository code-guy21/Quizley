//
//  CustomTabBarController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import Firebase


//var access: String?
var userColors: UserColors?

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
        }
        
        fetchUser()
        reloadInputViews()
            
    }
    var user: User?
    
    func fetchUser() {
        
        var access : String?
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {return}
       
        FIRDatabase.fetchUserWithUID(uid: uid) { (user) in
            self.user = user
            access = user.access
            self.setupViewControllers(access: access!)
            userColors = UserColors(access: access!)
            //self.viewDidLoad()
            
        }
    }
    

     func setupViewControllers(access: String) {
        let layout = UICollectionViewFlowLayout()
        let myModuleListController = MyModuleListController(collectionViewLayout: layout)
        let navMyModuleListController = UINavigationController(rootViewController: myModuleListController)
        navMyModuleListController.tabBarItem.title = "play"
        navMyModuleListController.tabBarItem.image = UIImage(named: "play")
        
        let addMController = AddMController(collectionViewLayout: layout)
        let navAddMController = UINavigationController(rootViewController: addMController)
        navAddMController.tabBarItem.title = "add"
        navAddMController.tabBarItem.image = UIImage(named: "add")
        
        let settingListController = SettingListController(collectionViewLayout: layout)
        let navSettingListController = UINavigationController(rootViewController: settingListController)
        navSettingListController.tabBarItem.title = "settings"
        navSettingListController.tabBarItem.image = UIImage(named: "settings")
        
        let teacherAddModuleController = TeacherAddModuleController(collectionViewLayout: layout)
        let navteacherAddModuleController = UINavigationController(rootViewController: teacherAddModuleController)
        navteacherAddModuleController.tabBarItem.title = "add"
        navteacherAddModuleController.tabBarItem.image = UIImage(named: "add")
        
        tabBar.tintColor = .red
        
        if(access == "teacher") {
            viewControllers = [navMyModuleListController,navteacherAddModuleController,navSettingListController]
            
        } else if (access == "student") {
        viewControllers = [navMyModuleListController,navAddMController,navSettingListController]
        }
    }
    
}
