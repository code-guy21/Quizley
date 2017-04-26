//
//  SecondGameController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/9/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import LBTAComponents
import Lottie

class GameCountController: UIViewController {
    
    let animationCountView: LOTAnimationView = {
        let AV = LOTAnimationView.animationNamed("countdown")
        AV?.contentMode = .scaleAspectFill
        return AV!
    }()
    
    
    var dictionary: [String:Any]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(r: 201, g: 224, b: 255)
        
        view.addSubview(animationCountView)
        
        //setupStartLabel()
        animationCountView.anchorCenterXToSuperview()
        animationCountView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 150, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 240)
        animationCountView.play { (true) in
            let modalStyle = UIModalTransitionStyle.flipHorizontal
            let gameController:GameController = GameController()
            gameController.modalTransitionStyle = modalStyle
            gameController.dictionary = self.dictionary
            self.present(gameController, animated: true, completion: nil)
        }
    }
    
}
