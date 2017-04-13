//
//  ListController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents
import Firebase

class ListController: DatasourceController {
    
    //handel rotating the screen to reset all the views
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    let list = ModuleDatasource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        setupNavigationBarItemList()
        //this was how we use to set
        //let list = ModuleDatasource()
        self.datasource = list
        print(list.modules[1].name)
        
    }
    
    fileprivate func setupNavigationBarItemList() {
        let navBar = navigationController?.navigationBar
        navBar?.barTintColor = UIColor(r: 0, g: 180, b: 248)
        navBar?.isTranslucent = false
        
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
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        SharedModuleData.shared.name = self.list.modules[indexPath.row].name
        SharedModuleData.shared.status = self.list.modules[indexPath.row].status
        SharedModuleData.shared.moduleImage = self.list.modules[indexPath.row].moduleImage
        let controller = LoadGameController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
