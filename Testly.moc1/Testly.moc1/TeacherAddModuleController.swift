//
//  TeacherAddModuleController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/19/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import Firebase

class TeacherAddModuleController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var userID: String?
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    
        collectionView?.backgroundColor = .white
    
    
        collectionView?.register(AddCell.self, forCellWithReuseIdentifier: cellID)
    
    
        collectionView?.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        setupNavigationBarItemList()
    
        collectionView?.alwaysBounceVertical = true
        
    
    }


    fileprivate func setupNavigationBarItemList() {
        let navBar = navigationController?.navigationBar
        navBar?.barTintColor = UIColor(r: 176, g: 21, b: 55)
        navBar?.isTranslucent = false
        
        
        navigationItem.title = "Create a class"
    
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AddCell
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 1500)
    }
    
    func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    func Yes() {
        print("dfsd")
        //handleAdd()
        navigationController?.popViewController(animated: true)
        let gameCountController = GameCountController()
        navigationController?.pushViewController(gameCountController, animated: true)
        //animateOut()
    }
    
//    fileprivate func handleAdd() {
//        guard let mId = moduleID else { return }
//        
//        guard let uid = FIRAuth.auth()?.currentUser?.uid else { return }
//        
//        let userModuleRef = FIRDatabase.database().reference().child("users").child(uid).child("modules")
//        let values = [mId: 1]
//        userModuleRef.updateChildValues(values) { (err, ref) in
//            
//            if let err = err {
//                print("Failed to get module",err)
//                return
//            }
//            
//            print("Success", mId)
//        }
//    }

}
