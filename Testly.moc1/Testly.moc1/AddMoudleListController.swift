//
//  AddMController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/19/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import Firebase

class AddMController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var userID: String?
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.backgroundColor = .white
        
        collectionView?.register(Mod3Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        
        collectionView?.register(ModuleCell3.self, forCellWithReuseIdentifier: cellID)
        
        
        collectionView?.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        setupNavigationBarItemList()
        
        collectionView?.alwaysBounceVertical = true
        fetchModules()
        
    }
    
    var modules = [Module]()
    
    func fetchModules() {
        //our classes
        
        let ref = FIRDatabase.database().reference().child("modules")
        ref.observeSingleEvent(of: .value, with:{ (snapshot) in
                
                guard let dictionaries = snapshot.value as? [String:Any] else { return }
                
                dictionaries.forEach({ (key, value) in
                
                guard let userDictionary = value as? [String:Any] else { return }
                    
                    let module = Module(mId: key, dictionary: userDictionary)
                self.modules.append(module)
                })
            
                self.collectionView?.reloadData()
                    
            }) { (err) in
                print("Failed to fetch ordered Modules:", err)
            }
    }
    
    fileprivate func setupNavigationBarItemList() {
        let navBar = navigationController?.navigationBar
        navBar?.barTintColor = UIColor(r: 0, g: 180, b: 248)
        navBar?.isTranslucent = false
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let module = modules[indexPath.item]
        let addModuleController = AddModuleController(collectionViewLayout: UICollectionViewFlowLayout())
        addModuleController.moduleID = module.mId
        
        navigationController?.pushViewController(addModuleController, animated: true)
   () }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modules.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! ModuleCell3
        
        cell.module = modules[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 66)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath) as! Mod3Header
        
        header.headerText = "Our Classes"
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 40)
    }
}
