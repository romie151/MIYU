//
//  ProfileMenuCell.swift
//  Miyu
//
//  Created by Mira Estil on 3/15/18.
//  Copyright © 2018 ME. All rights reserved.
//

import UIKit

class ProfileMenuCell: BaseCell {
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = UIColor.gray
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override var isSelected: Bool {
        didSet {
            imageView.tintColor = isSelected ? UIColor.white : UIColor.gray
        }
    }
    
    override func setupViews() {
        super.setupViews()
    
        addSubview(imageView)
        addConstraints(format: "H:[v0(28)]", views: imageView)
        addConstraints(format: "V:[v0(28)]", views: imageView)

        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
        
    }
}
