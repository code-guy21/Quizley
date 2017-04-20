
//
//  AddCellHeader.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/19/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents

class AddCellHeader: DatasourceCell{
    
    //here we make a lable for the header
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

    
    override func setupViews() {
        super.setupViews()
        addSubview(className)
        addSubview(classCaption)
        
        backgroundColor = UIColor(r: 246, g: 228, b: 232)
        
        separatorLineView.isHidden = false
        
        className.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 100, bottomConstant: 0, rightConstant: 100, widthConstant: 0, heightConstant: 30)
        classCaption.anchor(className.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 100, bottomConstant: 0, rightConstant: 100, widthConstant: 0, heightConstant: 30)
    }
}
