//
//  AddModule.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/17/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit
import LBTAComponents
import Firebase

class AddModuleController2: DatasourceController{
    let classNameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Class Name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let classCaptionTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Class Caption"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let questionOneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Question One"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerOneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer One"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let questionTwoTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Question Two"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerTwoTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Two"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let questionThreeTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Question Three"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerThreeTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Three"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let questionFourTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Question Four"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerFourTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Four"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let questionFiveTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Question Five"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerFiveTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Five"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 51, g: 105, b: 255)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 40
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handelSave), for: .touchUpInside)
        return button
    }()
    
    @IBAction func handelSave(sender: UIButton) {
        guard let name = classNameTextField.text, name.characters.count > 0 else { return }
        guard let caption = classCaptionTextField.text, caption.characters.count > 0 else { return }
        
        guard let Q1 = questionOneTextField.text, Q1.characters.count > 0 else { return }
        guard let A1 = answerOneTextField.text, A1.characters.count > 0 else { return }
        
        guard let Q2 = questionTwoTextField.text, Q2.characters.count > 0 else { return }
        guard let A2 = answerTwoTextField.text, A2.characters.count > 0 else { return }
        
        guard let Q3 = questionThreeTextField.text, Q3.characters.count > 0 else { return }
        guard let A3 = answerThreeTextField.text, A3.characters.count > 0 else { return }
        
        guard let Q4 = questionFourTextField.text, Q4.characters.count > 0 else { return }
        guard let A4 = answerFourTextField.text, A4.characters.count > 0 else { return }
        
        guard let Q5 = questionFiveTextField.text, Q5.characters.count > 0 else { return }
        guard let A5 = answerFiveTextField.text, A5.characters.count > 0 else { return }
        
        guard let uid = FIRAuth.auth()?.currentUser?.uid else { return }
        
        let userPostRef = FIRDatabase.database().reference().child("modules").child(uid)
        
        let ref = userPostRef.childByAutoId()
        
        let values = ["ClassName": name, "ClassCaption":caption, "Q1":Q1, "A1": A1, "Q2":Q2, "A2": A2, "Q3":Q3, "A3": A3, "Q4":Q4, "A4": A4, "Q5":Q5, "A5": A5] as [String : Any]
        
        ref.updateChildValues(values) { (err, ref) in
            if let err = err {
                print("Failed to DB", err)
                return
            }
            
            print("Succ to DB")
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestions()
        setupAnsers()
        
        view.addSubview(saveButton);
        saveButton.anchor(questionFiveTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 50, leftConstant: 100, bottomConstant: 0, rightConstant: 100, widthConstant: 0, heightConstant: 100)
        
    }
    
    fileprivate func setupQuestions() {
        let stackView = UIStackView(arrangedSubviews: [classNameTextField,questionOneTextField,questionTwoTextField,questionThreeTextField,questionFourTextField,questionFiveTextField])
        
        view.addSubview(stackView)
        
        stackView.distribution = .fillEqually;
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 100, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 0)
    
    }
    fileprivate func setupAnsers() {
        let stackView = UIStackView(arrangedSubviews: [classCaptionTextField,answerOneTextField,answerTwoTextField,answerThreeTextField,answerFourTextField,answerFiveTextField])
        
        view.addSubview(stackView)
        
        stackView.distribution = .fillEqually;
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 100, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 150, heightConstant: 0)
        
    }
}
