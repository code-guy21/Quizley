//
//  SettingsController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents
import Firebase

class SettingsController: DatasourceController {
    
    //handel rotating the screen to reset all the views
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    
    let list = SettingsDatasource()
    
    override func viewDidLoad() {
        //handleLogout()
        //checkIfUserIsLoggedIn()
        super.viewDidLoad()
        //        collectionView?.backgroundColor = .white
        collectionView?.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        
        
        
        setupNavigationBarItemList()
        //this was how we use to set
        self.datasource = list
        
        setupLogOutButton()

    }
    
    fileprivate func setupLogOutButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleLogOut))
    }
    
    func handleLogOut() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
            
            do {
                try FIRAuth.auth()?.signOut()
                
                //change UiViews
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
        navBar?.barTintColor = UIColor(r: 0, g: 180, b: 248)
        navBar?.isTranslucent = false
        
        navigationItem.title = "Settings"
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    //**sizeforItemAt
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 45)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        SharedModuleData.shared.name = self.list.settings[indexPath.row].type
        let controller = SelectedSettingController(myStg: "hi")
        //        let controller = GameController()
        navigationController?.pushViewController(controller, animated: true)
    }
    func checkIfUserIsLoggedIn() {
        if FIRAuth.auth()?.currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            let uid = FIRAuth.auth()?.currentUser?.uid
            FIRDatabase.database().reference().child("users").child(uid!).observeSingleEvent(of: .value, with: { (snapshot) in
                
                if let dictionary = snapshot.value as? [String: AnyObject] {
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
            }, withCancel: nil)
        }
    }
    
    func handleLogout() {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginRegisterController = LoginRegisterController()
        present(loginRegisterController, animated: true, completion: nil)
    }
    
}
