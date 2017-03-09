//
//  SelectedSettingController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/9/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import LBTAComponents
import Toucan

class SelectedSettingController: UIViewController {
    
    public var myString: String = ""
    var myString2: String = ""
    convenience init() {
        self.init(myStg: nil)
    }
    
    init(myStg: String?) {
        self.myString = myStg!
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.text = "  Miguel"
        textField.backgroundColor = .white
        return textField
    }()
    
    let lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.text = "  Chavez"
        textField.backgroundColor = .white
        return textField
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 51, g: 105, b: 255)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 35
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(Save), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Name"
        view.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        view.addSubview(saveButton)
        view.addSubview(firstNameTextField)
        view.addSubview(lastNameTextField)
        
        
        firstNameTextField.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 30, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        lastNameTextField.anchor(firstNameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 5, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        
        saveButton.anchorCenterXToSuperview()
        saveButton.anchor(lastNameTextField.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 70)
        
        
    }
    
    
    @IBAction func Save(sender: UIButton) {
   
    }
    
}
