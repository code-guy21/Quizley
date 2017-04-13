//
//  ModuleHeader.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents

class SelectBasicModuleHeader: DatasourceCell{
    
    //here we make a lable for the header
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Our Classes"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(r: 130,g: 130,b: 130)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        addSubview(textLabel)
        
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        //separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class SelectBasicModuleFooter: DatasourceCell{
    //here we make a lable for the header
//    let textLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Show me more"
//        label.font = UIFont.systemFont(ofSize: 15)
//        label.textColor = UIColor(r: 130,g: 130,b: 130)
//        return label
//    }()
//    
    override func setupViews() {
        separatorLineView.isHidden = false
    }
//        super.setupViews()
//        
//        let whiteBackgrounView = UIView()
//        whiteBackgrounView.backgroundColor = .white
//        
//        addSubview(whiteBackgrounView)
//        addSubview(textLabel)
//        
//        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//        
//        whiteBackgrounView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
//    }
}
