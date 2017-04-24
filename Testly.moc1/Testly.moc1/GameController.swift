//
//  GameController.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/10/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import Firebase
import Lottie

class GameController: UIViewController {
    
    let numberOfQuestions = 5
    
    let logoContainerView: UIView = {
        let view = UIView()
        
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logoblue"))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 140, height: 140)
        logoImageView.contentMode = .scaleAspectFit
        
        view.addSubview(logoImageView)
        logoImageView.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 140, heightConstant: 140)
        logoImageView.anchorCenterSuperview()
        //view.backgroundColor = UIColor(r: 0, g: 120, b: 176)
        return view
    }()
    
    let timeLeftLabel:// UILabel = {
//        let label = UILabel()
//        
//        let attributedText = NSMutableAttributedString(string: "Time:\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
//        
//        attributedText.append(NSAttributedString(string: "20", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
//        
//        label.attributedText = attributedText
//        label.numberOfLines=0
//        label.textAlignment = .center
//        label.backgroundColor = UIColor(r: 0, g: 120, b: 176)
//        return label
        LOTAnimationView = {
            let AV = LOTAnimationView.animationNamed("colorline")
            AV?.contentMode = .scaleAspectFill
            AV?.loopAnimation = true
            AV?.play()
            return AV!
    }()
    
    let questionNumberLabel: //UILabel = {
//        let label = UILabel()
//        
//        let attributedText = NSMutableAttributedString(string: "Question:\n", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
//        
//        attributedText.append(NSAttributedString(string: "1/10", attributes: [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 14)]))
//        
//        label.attributedText = attributedText
//        label.numberOfLines=0
//        label.textAlignment = .center
//        label.backgroundColor = UIColor(r: 0, g: 120, b: 176)
//        return label
     LOTAnimationView = {
        let AV = LOTAnimationView.animationNamed("colorline")
        AV?.contentMode = .scaleAspectFill
        AV?.loopAnimation = true
        AV?.play()
        return AV!
    }()
    
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(r: 149, g: 204, b: 244)
        label.layer.cornerRadius = 5
        label.text = "what is the question?"
        label.textAlignment = .center
        label.numberOfLines = 0

        return label
    }()
    
    let wrongLabel: LOTAnimationView = {
        let AV = LOTAnimationView.animationNamed("x_pop")
        AV?.contentMode = .scaleAspectFill
        return AV!
    }()
    
    let correctLabel: LOTAnimationView = {
        let AV = LOTAnimationView.animationNamed("star_pop")
        AV?.contentMode = .scaleAspectFill
        return AV!
    }()
    
    let nextQuestionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NextQuestion", for: .normal)
        button.backgroundColor = UIColor(r: 149, g: 204, b: 244)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nextQuestion), for: .touchUpInside)
        
        return button
    }()
    
    let playAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play Again", for: .normal)
        button.backgroundColor = UIColor(r: 0, g: 120, b: 176)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
        
        return button
    }()
    
    let exitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Exit", for: .normal)
        button.backgroundColor = UIColor(r: 0, g: 120, b: 176)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(exit), for: .touchUpInside)
        
        return button
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
    
    
    //creating a session of roundController with 4 questions per round as default value, this value could be changed editing
    //the numberOfQuestions value.
    var roundController: RoundController? //= RoundController()
    //roundController.dictionary = self.dictionary
    //print(self.dictionary!)
    
    //boolean used to check if the user has answered or not to prevent double answer or skip to the next question without answer
    var answered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestionHeader()
        
        view.addSubview(questionLabel)
        questionLabel.anchor(questionNumberLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 180)
        
        navigationController?.isNavigationBarHidden = true
        print(self.dictionary)
        roundController = RoundController(questionsPerRound: numberOfQuestions, dictionary: self.dictionary!)
        
        
        view.backgroundColor = .white
        setupAnswerButtons()
        
        view.addSubview(exitButton)
        view.addSubview(playAgainButton)
        playAgainButton.anchor(questionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 50)
        exitButton.anchor(playAgainButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 50)
        
        roundController?.displayQuestion(questionLabel, buttons: [answerOneButton, answerTwoButton, answerThreeButton, answerFourButton], objectsToHide:  [wrongLabel, correctLabel, playAgainButton,exitButton])
        
        view.addSubview(wrongLabel)
        wrongLabel.anchorCenterXToSuperview()
        wrongLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 150, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 240)
        
        view.addSubview(correctLabel)
        correctLabel.anchorCenterXToSuperview()
        correctLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 150, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 240)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    fileprivate func setupAnswerButtons() {
        
        let stackView  = UIStackView(arrangedSubviews: [answerOneButton, answerTwoButton, answerThreeButton, answerFourButton,nextQuestionButton])
        
        view.addSubview(stackView)
    
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(questionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 200)
        
        
    }
    fileprivate func setupEndButtons() {
        let stackView  = UIStackView(arrangedSubviews: [playAgainButton])
        
        view.addSubview(stackView)
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(questionLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 40, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 200)
    }
    
    fileprivate func setupQuestionHeader() {
        let stackview = UIStackView(arrangedSubviews: [questionNumberLabel,logoContainerView,timeLeftLabel])
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        
        
        
        stackview.backgroundColor = UIColor(r: 0, g: 120, b: 176)
        view.addSubview(stackview)
        stackview.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 180)
    }
    
    func exit() {
        
        //self.navigationController?.popViewController(animated: true)
        let modalStyle = UIModalTransitionStyle.crossDissolve
        let customTabBarConroller:CustomTabBarConroller = CustomTabBarConroller()
        customTabBarConroller.modalTransitionStyle = modalStyle
        customTabBarConroller.setupViewControllers(access: (userColors?.access)!)
        self.present(customTabBarConroller, animated: true, completion: nil)
        
    }
    
    //method called when the nextQuestionButton is pressed
    func nextQuestion(_ sender: AnyObject) {
        if answered {
            nextRound()
            answered = false
        }
    }
    
    func checkAnswer(_ sender: UIButton) {
        if !answered {
            answered = true
            let isCorrect: Bool = roundController!.checkAnswer(sender, buttons: [answerOneButton, answerTwoButton, answerThreeButton, answerFourButton])
            if isCorrect {
                //if is correct
                //playYesSound()
                correctLabel.isHidden = false
                correctLabel.play(completion: { (true) in
                    self.correctLabel.isHidden = true
                })
            } else {
                //if is wrong
                //playNoSound()
                wrongLabel.isHidden = false
                wrongLabel.play(completion: { (true) in
                    self.wrongLabel.isHidden = true
                })
            }
        }
    }
    
    func displayScore() {
        // Hide the answer buttons
        answerOneButton.isHidden = true
        answerTwoButton.isHidden = true
        answerThreeButton.isHidden = true
        answerFourButton.isHidden = true
        wrongLabel.isHidden = true
        correctLabel.isHidden = true
        nextQuestionButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        exitButton.isHidden = false
        
        questionLabel.text = "Way to go!\nYou got \((roundController?.correctQuestions)! ) out of \((roundController?.questionsPerRound)!) correct!"
        
    }
    
    func playAgain() {
        // Show the answer buttons
        answerOneButton.isHidden = false
        answerTwoButton.isHidden = false
        answerThreeButton.isHidden = false
        answerFourButton.isHidden = false
        nextQuestionButton.isHidden = false
        
        //NEED TO RESET VALUES
        
        roundController = RoundController(questionsPerRound: numberOfQuestions, dictionary: self.dictionary!)
        //roundController.dictionary = self.dictionary
        nextRound()
    }
    
    var dictionary: [String:Any]?
    
    
    //method to skip to the next question/round
    func nextRound() {
        if (roundController?.isLastRound())! {
            // Game is over
            displayScore()
        } else {
            // Continue game
            roundController?.displayQuestion(questionLabel, buttons: [answerOneButton, answerTwoButton, answerThreeButton, answerFourButton], objectsToHide:  [wrongLabel, correctLabel, playAgainButton, exitButton])
        }
    }

}
