//
//  Mod3Header.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/19/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents

class Mod3Header: UICollectionViewCell {
    
    var headerText: String? {
        didSet {
            textLabel.text = headerText
        }
    }
    
    //here we make a lable for the header
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Classes"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(r: 130,g: 130,b: 130)
        return label
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        addSubview(textLabel)
        
        backgroundColor = .white
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        addSubview(separatorView)
        separatorView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
