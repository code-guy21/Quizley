//
//  AddCell.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/19/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//


import LBTAComponents
class AddCell: UICollectionViewCell {
    let questionOneTextView: UITextView = {
        let tf = UITextView()
        tf.text = "Question"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerOneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer One"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerTwoTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Two"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerThreeTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Three"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerFourTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Four"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let numForAnswer: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Which answer is correct? i.e 1 .. 4"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    
//     func handelSave(sender: UIButton) {
//        
//        guard let Q1 = questionOneTextField.text, Q1.characters.count > 0 else { return }
//        guard let A1 = answerOneTextField.text, A1.characters.count > 0 else { return }
//        guard let A2 = answerTwoTextField.text, A2.characters.count > 0 else { return }
//        guard let A3 = answerThreeTextField.text, A3.characters.count > 0 else { return }
//        guard let A4 = answerFourTextField.text, A4.characters.count > 0 else { return }
//        
//        guard let uid = FIRAuth.auth()?.currentUser?.uid else { return }
//        
//        let userPostRef = FIRDatabase.database().reference().child("modules").child(uid)
//        
//        let ref = userPostRef.childByAutoId()
//        
//        let values = ["ClassName": name, "ClassCaption":caption, "Q1":Q1, "A1": A1, "Q2":Q2, "A2": A2, "Q3":Q3, "A3": A3, "Q4":Q4, "A4": A4, "Q5":Q5, "A5": A5] as [String : Any]
//        
//        ref.updateChildValues(values) { (err, ref) in
//            if let err = err {
//                print("Failed to DB", err)
//                return
//            }
//            
//            print("Succ to DB")
//            self.dismiss(animated: true, completion: nil)
//        }
//    }
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(r: 176, g: 21, b: 55)
    
        addSubview(questionOneTextView)
        questionOneTextView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 140)
        
        setupAnsers()
        
        addSubview(numForAnswer)
        numForAnswer.anchor(questionOneTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 80, bottomConstant: 0, rightConstant: 80, widthConstant: 0, heightConstant: 25)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupAnsers() {
        let stackView = UIStackView(arrangedSubviews: [answerOneTextField,answerTwoTextField,answerThreeTextField,answerFourTextField])
        
        addSubview(stackView)
        
        stackView.distribution = .fillEqually;
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(questionOneTextView.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 160, heightConstant: 140)
        
    }
}
