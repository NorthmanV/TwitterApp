//
//  Cells.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 24.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .blue
    }
}

class UserFooter: DatasourceCell {
    override func setupViews() {
        super.setupViews()
        backgroundColor = .green
    }
}

class UserCell: DatasourceCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Text"
        return label
    }()
    
    override var datasourceItem: Any? {
        didSet {
            nameLabel.text = datasourceItem as? String
        }
    }
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .orange
        addSubview(nameLabel)
        nameLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
