//
//  LoginRegisterController.swift
//  InstagramFirebase
//
//  Created by Miguel Chavez on 3/27/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//


import LBTAComponents
import Firebase

class LoginRegisterController: UIViewController, UINavigationControllerDelegate {
    
    let logoContainerView: UIView = {
        let view = UIView()
        
        let logoImageView = UIImageView(image: #imageLiteral(resourceName: "logored"))
        logoImageView.frame = CGRect(x: 0, y: 0, width: 120, height: 120)
        logoImageView.contentMode = .scaleAspectFit
        
        view.addSubview(logoImageView)
        logoImageView.anchor(nil, left: nil, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 120, heightConstant: 120)
        logoImageView.anchorCenterSuperview()
        view.backgroundColor = UIColor(r: 0, g: 120, b: 176)
        return view
    }()
    
    let studentLabel: UILabel = {
        let label = UILabel()
        label.text = "Student"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = UIColor(r: 0, g: 152, b: 233)
        label.textAlignment = .center
        return label
    }()
    
    lazy var loginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor(r: 0, g: 152, b: 233)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return sc
    }()
    
    func handleLoginRegisterChange() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            setupLoginFields()
        }
        else {
            setupRegisterFields()
        }
    }
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    
    
    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.keyboardType = .emailAddress
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Phone"
        tf.keyboardType = .phonePad
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Name"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return tf
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(r: 149, g: 204, b: 244)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        
        button.isEnabled = false
        
        return button
    }()
    
    func handleLogin() {
        guard let email = emailTextField.text else {return }
        guard let password = passwordTextField.text else {return }
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user,err ) in
            if let err = err {
                print("Failed to sign in with email", err)
                return
            }
            guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? CustomTabBarConroller else {return}
            mainTabBarController.fetchUser()
            self.dismiss(animated: true, completion: nil)
//            self.fetchUser()
//            
//            if(self.access == "student") {
//            print("it worked" , user?.uid ?? "")
//            
//            guard let mainTabBarController = UIApplication.shared.keyWindow?.rootViewController as? CustomTabBarConroller else {return}
//            mainTabBarController.setupStudentViewControllers()
//            self.dismiss(animated: true, completion: nil)
//            }
//            else {
//                self.handleLogout()
//                return
//            }
            
        })
    }
    
    var user: User?
    var access: String?

    fileprivate func fetchUser() {
    
        guard let uid = FIRAuth.auth()?.currentUser?.uid else {return}
        FIRDatabase.fetchUserWithUID(uid: uid) { (user) in
            self.user = user
            self.access = user.access
        }
    }
    
    func handleLogout() {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
    }

    let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.backgroundColor = UIColor(r: 149, g: 204, b: 244)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        
        button.isEnabled = false
        
        return button
    }()
    
    func handleRegister() {
        view.endEditing(true)
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let username = usernameTextField.text else { return }
        guard let name = nameTextField.text else { return }
        guard let phone = phoneTextField.text else { return }
        
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            guard let uid = user?.uid else { return }
            
            let dictionaryValues = ["username": username,"email": email,
                                      "name": name, "phone":phone, "password":password, "access":"student"]
            let values = [uid: dictionaryValues]
            FIRDatabase.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err,
                ref) in
                
                if let err = err {
                    print("Failed", err)
                    return
                }
                
                print("Succ")
            })
            
        })
    }
    
    func handleTextInputChange() {
        let isLoginVaild = emailTextField.text?.characters.count ?? 0 > 0 &&
            passwordTextField.text?.characters.count ?? 0 > 0
        
        if isLoginVaild {
            loginButton.backgroundColor = UIColor(r: 17, g: 154, b: 237)
            loginButton.isEnabled = true
        }
        else {
            loginButton.backgroundColor = UIColor(r: 149, g: 204, b: 244)
            loginButton.isEnabled = false
        }
        
        let isRegisterVaild = emailTextField.text?.characters.count ?? 0 > 0 &&
            passwordTextField.text?.characters.count ?? 0 > 5 &&
            usernameTextField.text?.characters.count ?? 0 > 0 &&
            nameTextField.text?.characters.count ?? 0 > 0 &&
            phoneTextField.text?.characters.count ?? 0 > 0
        
        if isRegisterVaild {
            registerButton.backgroundColor = UIColor(r: 17, g: 154, b: 237)
            registerButton.isEnabled = true
        }
        else {
            registerButton.backgroundColor = UIColor(r: 149, g: 204, b: 244)
            registerButton.isEnabled = false
        }
    }
    
    let becomeAnAdminButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedTitle = NSMutableAttributedString(string: "Are you a teacher?  ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Login as a Teacher.", attributes: [NSForegroundColorAttributeName: UIColor(r: 17, g: 154, b: 237), NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)]))
        
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(becomeAnAdmin), for: .touchUpInside)
        return button
    }()
    
    func becomeAnAdmin() {
        let adminLoginRegisterController = AdminLoginRegisterController()
        navigationController?.pushViewController(adminLoginRegisterController, animated: true)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        view.addSubview(logoContainerView)
        logoContainerView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 160)
        
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
        
        view.addSubview(studentLabel);
        studentLabel.anchor(logoContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 30)
        
        view.addSubview(loginRegisterSegmentedControl)
        loginRegisterSegmentedControl.anchor(studentLabel.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 20)
        setupLoginFields()
    
        view.addSubview(becomeAnAdminButton)
        becomeAnAdminButton.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
    }
    
    fileprivate func setupLoginFields() {
        
        usernameTextField.removeFromSuperview()
        nameTextField.removeFromSuperview()
        phoneTextField.removeFromSuperview()
        registerButton.removeFromSuperview()
        let stackView  = UIStackView(arrangedSubviews: [emailTextField,passwordTextField, loginButton])
        
        view.addSubview(stackView)
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 10
        
        stackView.anchor(loginRegisterSegmentedControl.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 135)
        
    }
    
    fileprivate func setupRegisterFields() {
        
        
        loginButton.removeFromSuperview()
        let stackView  = UIStackView(arrangedSubviews: [nameTextField, phoneTextField, usernameTextField, emailTextField,passwordTextField, registerButton])
        
        view.addSubview(stackView)
        
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 5
        
        stackView.anchor(loginRegisterSegmentedControl.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 40, bottomConstant: 0, rightConstant: 40, widthConstant: 0, heightConstant: 205)
        
    }
}




