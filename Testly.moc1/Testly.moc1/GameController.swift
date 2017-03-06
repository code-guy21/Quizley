//
//  GameController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import LBTAComponents
import Toucan

class GameController: UIViewController {
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "main")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let newmig = Toucan(image: imageView.image!).resize(CGSize(width: 200, height: 200)).image
        imageView.image = newmig
        imageView.contentMode = .scaleAspectFill
        // imageView.frame = CGRect(x: 0, y: 0, width: 5, height: 5)
        
        
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 51, g: 105, b: 255)
        
        view.addSubview(profileImageView)
        
        //profileImage Blue
        profileImageView.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    }
}
