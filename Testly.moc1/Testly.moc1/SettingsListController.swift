//
//  SettingsListController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/20/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import Firebase

class SettingListController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "cellID"
    
    var settings: [Settings] = {
        
        
        let Name = Settings(type: "Name", UserInput: "", typeImage: #imageLiteral(resourceName: "name"))
        let UserName = Settings(type: "UserName", UserInput: "", typeImage: #imageLiteral(resourceName: "userNam"))
        let PhoneNum = Settings(type: "Phone Number", UserInput: "", typeImage: #imageLiteral(resourceName: "phoneNum"))
        let Email = Settings(type: "Email", UserInput: "", typeImage: #imageLiteral(resourceName: "email"))
        let Password = Settings(type: "Password", UserInput: "", typeImage: #imageLiteral(resourceName: "password"))
        
        
        return [Name,UserName,PhoneNum,Email,Password]
    }()
    
    override func viewDidLoad() {
        //handleLogout()
        //checkIfUserIsLoggedIn()
        super.viewDidLoad()
        //        collectionView?.backgroundColor = .white
        collectionView?.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        collectionView?.register(SettingCell.self, forCellWithReuseIdentifier: cellID)
        
        
        setupNavigationBarItemList()
        
        setupLogOutButton()
        
        collectionView?.alwaysBounceVertical = true
        setupSettings()
        
    }
    
    fileprivate func setupSettings() {
        guard let currentLoggedInUserId = FIRAuth.auth()?.currentUser?.uid else { return }
        FIRDatabase.fetchUserWithUID(uid: currentLoggedInUserId) { (user) in
            self.settings[0].UserInput = user.name
            self.settings[1].UserInput = user.username
            self.settings[2].UserInput = user.phone
            self.settings[3].UserInput = user.email
            self.settings[4].UserInput = user.password
            
            self.collectionView?.reloadData()
        }
        
    }
    
    fileprivate func setupLogOutButton() {
        navigationController?.popViewController(animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleLogout))
    }
    
    func handleLogout() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
            
            do {
                try FIRAuth.auth()?.signOut()
                
                //change UiViews
                print(self.navigationController?.childViewControllers.count)
                let loginRegisterController = LoginRegisterController()
                let navController = UINavigationController(rootViewController: loginRegisterController)
                self.present(navController, animated: true, completion: nil)
                
            } catch let signOutErr {
                print("Failed to signout", signOutErr)
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(alertController, animated: true,completion: nil)
    }
    
    fileprivate func setupNavigationBarItemList() {
        let navBar = navigationController?.navigationBar
        navBar?.barTintColor = userColors?.navColor
        navBar?.isTranslucent = false
        
        navigationItem.title = "Settings"
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settings.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! SettingCell
        
        cell.setting = settings[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 45)
    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        
//        //SharedModuleData.shared.name = self.list.settings[indexPath.row].type
//        let controller = SelectedSettingController(myStg: "hi")
//        //        let controller = GameController()
//        navigationController?.pushViewController(controller, animated: true)
//    }
    
}
