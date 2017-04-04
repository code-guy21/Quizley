//
//  AddModuleController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents
import Firebase

class SelectModuleController: DatasourceController {
    
    //handel rotating the screen to reset all the views
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    
    let list = SelectModuleDatasource()
    
    override func viewDidLoad() {
        //handleLogout()
        // checkIfUserIsLoggedIn()
        super.viewDidLoad()
        //        collectionView?.backgroundColor = .white
        collectionView?.backgroundColor = UIColor(r: 51, g: 105, b: 255)
        
        
        
        
        setupNavigationBarItemList()
        //this was how we use to set
        self.datasource = list
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0;
    }
    
    //**sizeforItemAt
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 70)
    }
    
    //size the header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    //size the footer
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 14)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            SharedModuleData.shared.name = self.list.addCompModules[indexPath.row].name
            SharedModuleData.shared.status = self.list.addCompModules[indexPath.row].status
            SharedModuleData.shared.moduleImage = self.list.addCompModules[indexPath.row].moduleImage
            let controller = AddCompModuleController(myStg: "hi")
            navigationController?.pushViewController(controller, animated: true)
        }
        else {
            SharedModuleData.shared.name = self.list.addBasicModules[indexPath.row].name
            SharedModuleData.shared.status = self.list.addBasicModules[indexPath.row].status
            SharedModuleData.shared.moduleImage = self.list.addBasicModules[indexPath.row].moduleImage
            let controller = AddBasicModuleController(myStg: "hi")
            navigationController?.pushViewController(controller, animated: true)
        }
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
        
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)
    }
    
}
