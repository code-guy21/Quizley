//
//  SecondGameController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/9/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import LBTAComponents
import Toucan

class SecondGameController: UIViewController {
    
    let countLabel: UIButton = {
        
        let temp = UIButton()
//        let label = UILabel()
//        label.text = "3"
//        label.font = UIFont.boldSystemFont(ofSize: 108)
//        label.textAlignment = .center
        //        //                label.backgroundColor = .blue
        temp.setTitle("3", for: .normal)
        temp.titleLabel?.font = UIFont(name: "arial", size: 108)
        temp.setTitleColor(.black, for: .normal)
        temp.addTarget(self, action: #selector(Reset), for: .touchUpInside)
        return temp
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 201, g: 224, b: 255)
        
        view.addSubview(countLabel)
        
        //setupStartLabel()
        countLabel.anchorCenterXToSuperview()
        countLabel.anchorCenterYToSuperview()
        countLabel.anchor(view.topAnchor, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 250, heightConstant: 40)
    }
    
    @IBAction func Reset(sender: UIButton) {
        
        let customTabBarConroller:CustomTabBarConroller = CustomTabBarConroller()
        self.present(customTabBarConroller, animated: true, completion: nil)
    }
}
