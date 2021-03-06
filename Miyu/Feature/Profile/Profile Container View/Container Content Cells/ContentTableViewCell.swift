//
//  ContentTableViewCell.swift
//  Miyu
//
//  Created by Mira Estil on 3/23/18.
//  Copyright © 2018 ME. All rights reserved.
//

import UIKit

/// Cell class for the container collection view cell where the user post data table view is instantiated
class ContentTableViewCell: BaseCell {
    
    lazy var view: ProfileContainerView = {
        let view = ProfileContainerView()
        return view
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(view)
        addConstraints(format: "H:|[v0]|", views: view)
        addConstraints(format: "V:|[v0]|", views: view)
        view.setupTableView()
    }
}
