//
//  SettingCell3.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/20/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import LBTAComponents
class SettingCell: UICollectionViewCell {
    var setting: Settings? {
        didSet {
            typeLabel.text = setting?.type
            userInputLabel.text = setting?.UserInput
            settingsImageView.image = setting?.typeImage
        }
    }
        //here we make a lable for the name GREEN
        let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "UserName"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        //        label.backgroundColor = .green
        return label
        }()
        
        //here we make a lable for the name Red
        let userInputLabel: UILabel = {
        let label = UILabel()
        label.text = "chavezucf"
        label.font = UIFont.systemFont(ofSize: 16)
        //        label.backgroundColor = .red
        label.textAlignment = .right
        
        return label
        }()
        
        let settingsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "userNam")
        //var color = 0
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        
        //        imageView.backgroundColor = .blue
        return imageView
        }()
        
        let nextImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "next")
        //        imageView.backgroundColor = .yellow
        return imageView
        }()
        
        //make it look how we want it
        override init (frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        
        
        // all the subareas in the cell (add JmenuItem to JmenuBar)
        addSubview(typeLabel)
        addSubview(userInputLabel)
        addSubview(nextImageView)
        addSubview(settingsImageView)
        
        //profileImage Blue
        settingsImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 25, heightConstant: 25)
        
        //nameLable Green
        typeLabel.anchor(self.topAnchor, left: settingsImageView.rightAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 8, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 20)
        
        //profileImage Blue
        nextImageView.anchor(self.topAnchor, left: nil, bottom: nil,right: self.rightAnchor, topConstant: 15, leftConstant: 0, bottomConstant: 0, rightConstant: 5, widthConstant: 15, heightConstant: 15)
        
        //statusLable Red
        userInputLabel.anchor(self.topAnchor, left: nil, bottom: nil, right: nextImageView.leftAnchor, topConstant: 12, leftConstant: 0 , bottomConstant: 0, rightConstant: 5, widthConstant: 250, heightConstant: 20)
    
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor(white: 0, alpha: 0.5)
    
        addSubview(separatorView)
        separatorView.anchor(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
