//
//  CustomTabBarController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit

class CustomTabBarConroller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up our cust bar
        
        //let layout = UICollectionViewFlowLayout()
        //let friendsController = FriendsController(collectionViewLayout: layout)
        //let recentMessagesNavController = UINavigationController(rootViewController: friendsController)
        let playController = UINavigationController(rootViewController: ListController())
        playController.tabBarItem.title = "play"
        playController.tabBarItem.image = UIImage(named: "play")
        
        let addController = UINavigationController(rootViewController: SelectModuleController())
        addController.tabBarItem.title = "add"
        addController.tabBarItem.image = UIImage(named: "add")
        
        let settingsController = UINavigationController(rootViewController: SettingsController())
        settingsController.tabBarItem.title = "settings"
        settingsController.tabBarItem.image = UIImage(named: "settings")
        
        tabBar.tintColor = .red
        
        viewControllers = [playController,addController,settingsController]
    }
}
