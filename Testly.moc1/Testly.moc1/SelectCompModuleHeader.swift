//
//  a.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents

class SelectCompModuleHeader: DatasourceCell{
    
    //here we make a lable for the header
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Custom Classes"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(r: 130,g: 130,b: 130)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
