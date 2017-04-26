//
//  GameController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import LBTAComponents
import Firebase

class LoadGameController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var moduleID: String?
    
    let startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 51, g: 105, b: 255)
        button.setTitle("Play", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 40
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(Play), for: .touchUpInside)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.textAlignment = .center
//                label.backgroundColor = .blue
        return label
    }()
    
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 26)
        label.textAlignment = .center
//                label.backgroundColor = .red
        return label
    }()
    
    
    let moduleImageView: UIImageView = {
        let imageView = UIImageView()
        var color = 0
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
//        imageView.backgroundColor = .yellow
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.delegate = self
        
        self.navigationItem.title = "Game"
        
        collectionView?.backgroundColor = userColors?.cellColor
        
        view.addSubview(moduleImageView)
        view.addSubview(startButton)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        
        //setupStartLabel()
        nameLabel.anchorCenterXToSuperview()
        nameLabel.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 70, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 40)
        
        statusLabel.anchorCenterXToSuperview()
        statusLabel.anchor(nameLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 400, heightConstant: 35)
        
        moduleImageView.anchorCenterXToSuperview()
        moduleImageView.anchor(statusLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 70)
        
        startButton.anchorCenterXToSuperview()
        startButton.anchor(moduleImageView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 80, heightConstant: 80)
        fetchModules()
    }
    
    var module: Module?
    var dictionary: [String:Any]?
    fileprivate func fetchModules() {
        guard let mId = moduleID else { return }
        FIRDatabase.fetchModuleWithMId(mId: mId) { (module, dictionary) in
            self.module = module
            self.dictionary = dictionary
            self.nameLabel.text = self.module?.className
            self.statusLabel.text = self.module?.classCaption
            self.collectionView?.reloadData()
            }
        }
    
    @IBAction func Play(sender: UIButton) {
        let modalStyle = UIModalTransitionStyle.flipHorizontal
        let gameCountController:GameCountController = GameCountController()
        gameCountController.modalTransitionStyle = modalStyle
        gameCountController.dictionary = self.dictionary
        self.present(gameCountController, animated: true, completion: nil)
    }
}
