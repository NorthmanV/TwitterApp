//
//  TweetCell.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 25.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile_image")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Some sample text"
        return tv
    }()
    
    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else {return}
            let attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)])
            let usernameString = "  \(tweet.user.username)\n"
            attributedText.append(NSAttributedString(string: usernameString, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15) ,NSAttributedStringKey.foregroundColor: UIColor.gray]))
            
            let paragtaphStyle = NSMutableParagraphStyle()
            paragtaphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.length)
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragtaphStyle, range: range)

            
            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]))
            
            messageTextView.attributedText = attributedText
        }
    }
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = .lightGray
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(messageTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }
}
