//
//  AddCell.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/19/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//


import LBTAComponents
import Firebase

class AddCell: UICollectionViewCell {
    
    let className: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Class Name", attributes:[NSForegroundColorAttributeName: UIColor.white])
        tf.placeholder = "Class Name"
        tf.backgroundColor = UIColor(r: 176, g: 21, b: 55)
        tf.textColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let classCaption: UITextField = {
        let tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Class Caption", attributes:[NSForegroundColorAttributeName: UIColor.white])
        //tf.placeholder = "Class Caption"
        tf.backgroundColor = UIColor(r: 176, g: 21, b: 55)
        tf.textColor = .white
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let questionOneTextView: UITextView = {
        let tf = UITextView()
        tf.text = "Question 1"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerOneTextFieldQ1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer One"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerTwoTextFieldQ1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Two"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerThreeTextFieldQ1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Three"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerFourTextFieldQ1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Four"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let numForAnswerQ1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Which answer is correct? i.e 1 .. 4"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let questionTwoTextView: UITextView = {
        let tf = UITextView()
        tf.text = "Question 2"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerOneTextFieldQ2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer One"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerTwoTextFieldQ2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Two"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerThreeTextFieldQ2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Three"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerFourTextFieldQ2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Four"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let numForAnswerQ2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Which answer is correct? i.e 1 .. 4"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let questionThreeTextView: UITextView = {
        let tf = UITextView()
        tf.text = "Question 3"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerOneTextFieldQ3: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer One"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerTwoTextFieldQ3: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Two"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerThreeTextFieldQ3: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Three"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerFourTextFieldQ3: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Four"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let numForAnswerQ3: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Which answer is correct? i.e 1 .. 4"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let questionFourTextView: UITextView = {
        let tf = UITextView()
        tf.text = "Question 4"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerOneTextFieldQ4: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer One"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerTwoTextFieldQ4: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Two"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerThreeTextFieldQ4: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Three"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerFourTextFieldQ4: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Four"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let numForAnswerQ4: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Which answer is correct? i.e 1 .. 4"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    let questionFiveTextView: UITextView = {
        let tf = UITextView()
        tf.text = "Question 5"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerOneTextFieldQ5: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer One"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerTwoTextFieldQ5: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Two"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerThreeTextFieldQ5: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Three"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let answerFourTextFieldQ5: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Answer Four"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let numForAnswerQ5: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Which answer is correct? i.e 1 .. 4"
        tf.backgroundColor = UIColor(white: 1, alpha: 0.9)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 176, g: 21, b: 55)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handelSave), for: .touchUpInside)
        return button
    }()
    
    
     func handelSave(sender: UIButton) {
        //header
        print("hi")
        guard let name = className.text, name.characters.count > 0 else { return }
        guard let caption = classCaption.text, caption.characters.count > 0 else { return }
        //Q1
        guard let Q1 = questionOneTextView.text, Q1.characters.count > 0 else { return }
        guard let A1Q1 = answerOneTextFieldQ1.text, A1Q1.characters.count > 0 else { return }
        guard let A2Q1 = answerTwoTextFieldQ1.text, A2Q1.characters.count > 0 else { return }
        guard let A3Q1 = answerThreeTextFieldQ1.text, A3Q1.characters.count > 0 else { return }
        guard let A4Q1 = answerFourTextFieldQ1.text, A4Q1.characters.count > 0 else { return }
        guard let numAQ1 = numForAnswerQ1.text, numAQ1.characters.count > 0 else { return }
        
        //Q2
        guard let Q2 = questionOneTextView.text, Q2.characters.count > 0 else { return }
        guard let A1Q2 = answerOneTextFieldQ2.text, A1Q2.characters.count > 0 else { return }
        guard let A2Q2 = answerTwoTextFieldQ2.text, A2Q2.characters.count > 0 else { return }
        guard let A3Q2 = answerThreeTextFieldQ2.text, A3Q2.characters.count > 0 else { return }
        guard let A4Q2 = answerFourTextFieldQ2.text, A4Q2.characters.count > 0 else { return }
        guard let numAQ2 = numForAnswerQ2.text, numAQ2.characters.count > 0 else { return }
        
        //Q3
        guard let Q3 = questionOneTextView.text, Q3.characters.count > 0 else { return }
        guard let A1Q3 = answerOneTextFieldQ3.text, A1Q3.characters.count > 0 else { return }
        guard let A2Q3 = answerTwoTextFieldQ3.text, A2Q3.characters.count > 0 else { return }
        guard let A3Q3 = answerThreeTextFieldQ3.text, A3Q3.characters.count > 0 else { return }
        guard let A4Q3 = answerFourTextFieldQ3.text, A4Q3.characters.count > 0 else { return }
        guard let numAQ3 = numForAnswerQ3.text, numAQ3.characters.count > 0 else { return }
        
        //Q4
        guard let Q4 = questionOneTextView.text, Q4.characters.count > 0 else { return }
        guard let A1Q4 = answerOneTextFieldQ4.text, A1Q4.characters.count > 0 else { return }
        guard let A2Q4 = answerTwoTextFieldQ4.text, A2Q4.characters.count > 0 else { return }
        guard let A3Q4 = answerThreeTextFieldQ4.text, A3Q4.characters.count > 0 else { return }
        guard let A4Q4 = answerFourTextFieldQ4.text, A4Q4.characters.count > 0 else { return }
        guard let numAQ4 = numForAnswerQ4.text, numAQ4.characters.count > 0 else { return }
        
        //Q5
        guard let Q5 = questionOneTextView.text, Q5.characters.count > 0 else { return }
        guard let A1Q5 = answerOneTextFieldQ5.text, A1Q5.characters.count > 0 else { return }
        guard let A2Q5 = answerTwoTextFieldQ5.text, A2Q5.characters.count > 0 else { return }
        guard let A3Q5 = answerThreeTextFieldQ5.text, A3Q5.characters.count > 0 else { return }
        guard let A4Q5 = answerFourTextFieldQ5.text, A4Q5.characters.count > 0 else { return }
        guard let numAQ5 = numForAnswerQ5.text, numAQ5.characters.count > 0 else { return }
        
        guard let uid = FIRAuth.auth()?.currentUser?.uid else { return }
        
        let userPostRef = FIRDatabase.database().reference().child("modules").child(uid)
        
        let ref = userPostRef.childByAutoId()
        
        let values = ["ClassName": name, "ClassCaption":caption, "Q1":Q1, "Q2":Q2, "Q3":Q3, "Q4":Q4, "Q5":Q5] as [String : Any]
        
        ref.updateChildValues(values) { (err, ref) in
            if let err = err {
                print("Failed to DB", err)
                return
            }
            
            print("Succ to DB")
            //self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(r: 176, g: 21, b: 55)
        
        let stackView  = UIStackView(arrangedSubviews: [className,classCaption])
        
        stackView.backgroundColor = UIColor(r: 246, g: 228, b: 232)
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        addSubview(stackView)
        stackView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 100)
        
    
        //Q1
        addSubview(questionOneTextView)
        questionOneTextView.anchor(stackView.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 140)
        
        setupAnsersQ1()
        
        addSubview(numForAnswerQ1)
        numForAnswerQ1.anchor(questionOneTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 80, bottomConstant: 0, rightConstant: 80, widthConstant: 0, heightConstant: 25)
        
        let separatorView1 = UIView()
        separatorView1.backgroundColor = UIColor(r: 245, g: 224, b: 229)
        
        addSubview(separatorView1)
        separatorView1.anchor(numForAnswerQ1.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        //Q2
        addSubview(questionTwoTextView)
        questionTwoTextView.anchor(separatorView1.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 140)
        
        setupAnsersQ2()
        
        addSubview(numForAnswerQ2)
        numForAnswerQ2.anchor(questionTwoTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 80, bottomConstant: 0, rightConstant: 80, widthConstant: 0, heightConstant: 25)
        
        let separatorView2 = UIView()
        separatorView2.backgroundColor = UIColor(r: 245, g: 224, b: 229)
        
        addSubview(separatorView2)
        separatorView2.anchor(numForAnswerQ2.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        //Q3
        addSubview(questionThreeTextView)
        questionThreeTextView.anchor(separatorView2.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 140)
        
        setupAnsersQ3()
        
        addSubview(numForAnswerQ3)
        numForAnswerQ3.anchor(questionThreeTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 80, bottomConstant: 0, rightConstant: 80, widthConstant: 0, heightConstant: 25)
        
        let separatorView3 = UIView()
        separatorView3.backgroundColor = UIColor(r: 245, g: 224, b: 229)
        
        addSubview(separatorView3)
        separatorView3.anchor(numForAnswerQ3.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        //Q4
        addSubview(questionFourTextView)
        questionFourTextView.anchor(separatorView3.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 140)
        
        setupAnsersQ4()
        
        addSubview(numForAnswerQ4)
        numForAnswerQ4.anchor(questionFourTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 80, bottomConstant: 0, rightConstant: 80, widthConstant: 0, heightConstant: 25)
        
        let separatorView4 = UIView()
        separatorView4.backgroundColor = UIColor(r: 245, g: 224, b: 229)
        
        addSubview(separatorView4)
        separatorView4.anchor(numForAnswerQ4.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        //Q5
        addSubview(questionFiveTextView)
        questionFiveTextView.anchor(separatorView4.bottomAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 10, leftConstant: 10, bottomConstant: 0, rightConstant: 0, widthConstant: 160, heightConstant: 140)
        
        setupAnsersQ5()
        
        addSubview(numForAnswerQ5)
        numForAnswerQ5.anchor(questionFiveTextView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 80, bottomConstant: 0, rightConstant: 80, widthConstant: 0, heightConstant: 25)
        
        let separatorView5 = UIView()
        separatorView5.backgroundColor = UIColor(r: 245, g: 224, b: 229)
        
        addSubview(separatorView5)
        separatorView5.anchor(numForAnswerQ5.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
        
        //footer
        //let footer = UIView()
        //footer.backgroundColor = UIColor(r: 246, g: 228, b: 232)
        //addSubview(footer)
        //footer.anchor(separatorView5.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        addSubview(saveButton)
        saveButton.anchor(separatorView5.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 100, bottomConstant: 0, rightConstant: 100, widthConstant: 0, heightConstant: 100)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupAnsersQ1() {
        let stackView = UIStackView(arrangedSubviews: [answerOneTextFieldQ1,answerTwoTextFieldQ1,answerThreeTextFieldQ1,answerFourTextFieldQ1])
        
        addSubview(stackView)
        
        stackView.distribution = .fillEqually;
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(questionOneTextView.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 160, heightConstant: 140)
        
    }
    
    fileprivate func setupAnsersQ2() {
        let stackView = UIStackView(arrangedSubviews: [answerOneTextFieldQ2,answerTwoTextFieldQ2,answerThreeTextFieldQ2,answerFourTextFieldQ2])
        
        addSubview(stackView)
        
        stackView.distribution = .fillEqually;
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(questionTwoTextView.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 160, heightConstant: 140)
        
    }
    fileprivate func setupAnsersQ3() {
        let stackView = UIStackView(arrangedSubviews: [answerOneTextFieldQ3,answerTwoTextFieldQ3,answerThreeTextFieldQ3,answerFourTextFieldQ3])
        
        addSubview(stackView)
        
        stackView.distribution = .fillEqually;
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(questionThreeTextView.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 160, heightConstant: 140)
        
    }
    fileprivate func setupAnsersQ4() {
        let stackView = UIStackView(arrangedSubviews: [answerOneTextFieldQ4,answerTwoTextFieldQ4,answerThreeTextFieldQ4,answerFourTextFieldQ4])
        
        addSubview(stackView)
        
        stackView.distribution = .fillEqually;
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(questionFourTextView.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 160, heightConstant: 140)
        
    }
    fileprivate func setupAnsersQ5() {
        let stackView = UIStackView(arrangedSubviews: [answerOneTextFieldQ5,answerTwoTextFieldQ5,answerThreeTextFieldQ5,answerFourTextFieldQ5])
        
        addSubview(stackView)
        
        stackView.distribution = .fillEqually;
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(questionFiveTextView.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 10, widthConstant: 160, heightConstant: 140)
        
    }
}
