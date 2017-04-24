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
    
    
        collectionView?.register(AddCell.self, forCellWithReuseIdentifier: cellID)
    
    
        collectionView?.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        setupNavigationBarItemList()
    
        collectionView?.alwaysBounceVertical = true
        
    
    }


    fileprivate func setupNavigationBarItemList() {
        let navBar = navigationController?.navigationBar
        navBar?.barTintColor = userColors?.navColor
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
    
}
