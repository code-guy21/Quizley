//
//  AddModuleController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/19/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import LBTAComponents
import Firebase

class AddModuleController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var moduleID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor(r: 201, g: 224, b: 255)
        
        view.addSubview(moduleImageView)
        view.addSubview(addButton)
        view.addSubview(nameLabel)
        view.addSubview(statusLabel)
        view.addSubview(classCodeTextField)
        view.addSubview(blurView)
        view.addSubview(otherView)
        
        
        nameLabel.anchorCenterXToSuperview()
        nameLabel.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 70, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 40)
        
        statusLabel.anchorCenterXToSuperview()
        statusLabel.anchor(nameLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 400, heightConstant: 35)
        
        moduleImageView.anchorCenterXToSuperview()
        moduleImageView.anchor(statusLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 70)
        
        classCodeTextField.anchorCenterXToSuperview()
        classCodeTextField.anchor(moduleImageView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 50)
        
        addButton.anchorCenterXToSuperview()
        addButton.anchor(classCodeTextField.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 50)
        
        
        if self.view.viewWithTag(100) != nil {
            blurView.removeFromSuperview()
        }
        
        if self.view.viewWithTag(200) != nil {
            blurView.removeFromSuperview()
            otherView.removeFromSuperview()
        }
        fetchModules()
    }
    
    var module: Module?
    fileprivate func fetchModules() {
        guard let mId = moduleID else { return }
        FIRDatabase.fetchModuleWithMId(mId: mId) { (module, dictionary) in
            self.module = module
            self.nameLabel.text = self.module?.className
            self.statusLabel.text = self.module?.classCaption
            
            
            self.collectionView?.reloadData()
        }
    }
    
    let classCodeTextField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Class Code"
        textField.backgroundColor = UIColor(white: 1, alpha: 0.15)
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 51, g: 105, b: 255)
        button.setTitle("Add", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(Add), for: .touchUpInside)
        return button
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Art"
        label.font = UIFont.boldSystemFont(ofSize: 38)
        label.textAlignment = .center
        return label
    }()
    
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Lets learn Art"
        label.font = UIFont.systemFont(ofSize: 26)
        label.textAlignment = .center
        return label
    }()
    
    
    let moduleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "school")
        var color = 0
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let blurView: UIVisualEffectView = {
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.light))
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.tag = 100
        return blurView
    }()
    
    let otherView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        let label = UILabel()
        label.text = "Sure you wan to add?"
        label.textAlignment = .center
        
        let yesButton = UIButton()
        yesButton.backgroundColor = UIColor(r: 51, g: 105, b: 255)
        yesButton.setTitle("Yes", for: .normal)
        yesButton.setTitleColor(.black, for: .normal)
        yesButton.layer.cornerRadius = 15
        yesButton.layer.masksToBounds = true
        yesButton.addTarget(self, action: #selector(Yes), for: .touchUpInside)
        
        let noButton = UIButton()
        noButton.backgroundColor = UIColor(r: 51, g: 105, b: 255)
        noButton.setTitle("No", for: .normal)
        noButton.setTitleColor(.black, for: .normal)
        noButton.layer.cornerRadius = 15
        noButton.layer.masksToBounds = true
        noButton.addTarget(self, action: #selector(No), for: .touchUpInside)
        
        view.addSubview(label)
        view.addSubview(yesButton)
        view.addSubview(noButton)
        label.anchorCenterXToSuperview()
        label.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 200, heightConstant: 20)
        yesButton.anchor(label.bottomAnchor, left: view.leftAnchor , bottom: nil, right: nil, topConstant: 12, leftConstant: 50, bottomConstant: 0, rightConstant: 0, widthConstant: 40, heightConstant: 40)
        noButton.anchor(label.bottomAnchor, left: nil , bottom: nil, right: view.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 50, widthConstant: 40, heightConstant: 40)
        view.tag = 200
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    func animateIn() {
        super.viewDidLoad()
        
        otherView.transform = CGAffineTransform.init(scaleX: 1.3, y:1.3)
        otherView.alpha = 0
        blurView.alpha = 0
        
        UIView.animate(withDuration: 0.3) {
            
            self.otherView.alpha = 1
            self.otherView.transform = CGAffineTransform.identity
            
            self.blurView.alpha = 1
            self.blurView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.3, animations:{
            self.otherView.transform = CGAffineTransform.init(scaleX: 1.3, y:1.3)
            self.otherView.alpha = 0
            self.blurView.alpha = 0
        }){ (success:Bool) in
            
            self.blurView.removeFromSuperview()
            self.otherView.removeFromSuperview()
        }
    }
    
    @IBAction func Add(sender: UIButton) {
        
        animateIn()
        view.addSubview(blurView)
        view.addSubview(otherView)
        blurView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        otherView.anchorCenterXToSuperview()
        otherView.anchorCenterYToSuperview()
        otherView.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 100)
    }
    
    @IBAction func No(sender: UIButton) {
        
        animateOut()
    }
    
    @IBAction func Yes(sender: UIButton) {
        
        handleAdd()
        let modalStyle = UIModalTransitionStyle.crossDissolve
        let customTabBarConroller:CustomTabBarConroller = CustomTabBarConroller()
        customTabBarConroller.modalTransitionStyle = modalStyle
        customTabBarConroller.setupStudentViewControllers()
        self.present(customTabBarConroller, animated: true, completion: nil)
        //animateOut()
    }
    
    fileprivate func handleAdd() {
        guard let mId = moduleID else { return }
        
        guard let uid = FIRAuth.auth()?.currentUser?.uid else { return }
        
        let userModuleRef = FIRDatabase.database().reference().child("users").child(uid).child("modules")
        let values = [mId: 1]
        userModuleRef.updateChildValues(values) { (err, ref) in
            
            if let err = err {
                print("Failed to get module",err)
                return
            }
            
            print("Success", mId)
        }
    }
}
