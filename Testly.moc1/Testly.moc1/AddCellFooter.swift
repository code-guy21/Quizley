//
//  AddCellFooter.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/19/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//
import LBTAComponents

class AddCellFooter: DatasourceCell{
    
    //here we make a lable for the header
    let saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(r: 176, g: 21, b: 55)
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 40
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handelSave), for: .touchUpInside)
        return button
    }()

    
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor(r: 246, g: 228, b: 232)
        
        separatorLineView.isHidden = false
        
        addSubview(saveButton);
        saveButton.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 100, bottomConstant: 0, rightConstant: 100, widthConstant: 0, heightConstant: 100)

    }
    
    func handelSave() {
        
    }

}


