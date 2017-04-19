//
//  GameController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/10/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import Firebase

class GameController: UIViewController {
    
    let logoContainerView: UIView = {
        let view = UIView()
        
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "math"))
        view.addSubview(logoImageView)
        logoImageView.anchorCenterSuperview()
        view.backgroundColor = UIColor(r: 0, g: 120, b: 176)
        return view
    }()
    
    let timeLeftLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Time:\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "20", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        label.numberOfLines=0
        label.textAlignment = .center
        label.backgroundColor = UIColor(r: 0, g: 120, b: 176)
        return label
    }()
    
    let questionNumberLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "Question:\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        
        attributedText.append(NSAttributedString(string: "1/10", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
        
        label.attributedText = attributedText
        label.numberOfLines=0
        label.textAlignment = .center
        label.backgroundColor = UIColor(r: 0, g: 120, b: 176)
        return label
    }()
    
    
    let questionTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(r: 149, g: 204, b: 244)
        tf.layer.cornerRadius = 5
        tf.text = "what is the question?"
        tf.textAlignment = .center

        return tf
    }()
    
    
    let answerOneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Answer 1", for: .normal)
        button.backgroundColor = UIColor(r: 149, g: 204, b: 244)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        
        return button
    }()
    
    let answerTwoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Answer 2", for: .normal)
        button.backgroundColor = UIColor(r: 149, g: 204, b: 244)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        
        return button
    }()
    
    let answerThreeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Answer 3", for: .normal)
        button.backgroundColor = UIColor(r: 149, g: 204, b: 244)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        
        return button
    }()
    
    let answerFourButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Answer 4", for: .normal)
        button.backgroundColor = UIColor(r: 149, g: 204, b: 244)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
        
        return button
    }()
    
    func handleLogin() {
        
    }
    
    func handleDontHaveAccount() {
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestionHeader()
        
        view.addSubview(questionTextField)
        questionTextField.anchor(questionNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 180)
        
        navigationController?.isNavigationBarHidden = true
        
        view.backgroundColor = .white
        setupAnswerButtons()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func setupAnswerButtons() {
        
        let stackView  = UIStackView(arrangedSubviews: [answerOneButton, answerTwoButton, answerThreeButton, answerFourButton])
        
        view.addSubview(stackView)
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(questionTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 200)
        
    }
    
    fileprivate func setupQuestionHeader() {
        let stackview = UIStackView(arrangedSubviews: [questionNumberLabel,logoContainerView,timeLeftLabel])
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        
        view.addSubview(stackview)
        stackview.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 180)
    }
    
    func checkAnswer() {
//        let modalStyle = UIModalTransitionStyle.crossDissolve
//        let correctAnswerController:CorrectAnswerController = CorrectAnswerController()
//        correctAnswerController.modalTransitionStyle = modalStyle
//        self.present(correctAnswerController, animated: true, completion: nil)
        
        let modalStyle = UIModalTransitionStyle.crossDissolve
        let customTabBarConroller:CustomTabBarConroller = CustomTabBarConroller()
        customTabBarConroller.modalTransitionStyle = modalStyle
        customTabBarConroller.setupStudentViewControllers()
        self.present(customTabBarConroller, animated: true, completion: nil)
        
    }
}
