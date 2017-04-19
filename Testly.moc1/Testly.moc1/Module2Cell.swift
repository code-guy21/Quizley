//
//  ModuleCell.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 3/6/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents
class Module2Cell: DatasourceCell {
    
    //    var color = 0;
    //this lables with the string array of HomeDatasource
    override var datasourceItem: Any?{
        didSet{
            guard let module = datasourceItem as? Module2 else { return }
            nameLabel.text = module.name + ":"
            statusLabel.text = module.status
            moduleImageView.image = module.moduleImage
        }
    }
    
    //here we make a lable for the name GREEN
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Math"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        //        label.backgroundColor = .green
        return label
    }()
    
    //here we make a lable for the name Red
    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Lets learn how to add"
        label.font = UIFont.systemFont(ofSize: 16)
        //        label.backgroundColor = .red
        return label
    }()
    
    //this make a spot for the image in the twitter app Blue
    let moduleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "math")
        //var color = 0
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
        //        imageView.backgroundColor = .blue
        return imageView
    }()
    
    //make it look how we want it
    override func setupViews() {
        super.setupViews()
        
        //        backgroundColor = .white
        
        backgroundColor = UIColor(r: 201, g: 224, b: 255)
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 0, g: 0, b: 0)
        
        
        // all the subareas in the cell (add JmenuItem to JmenuBar)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(moduleImageView)
        
        //profileImage Blue
        moduleImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        //nameLable Green
        nameLabel.anchor(moduleImageView.topAnchor, left: moduleImageView.rightAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 20)
        
        //statusLable Red
        statusLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 0, leftConstant: 0 , bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 20)
    }
}
