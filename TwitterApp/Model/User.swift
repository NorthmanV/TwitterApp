//
//  User.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 24.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImage: UIImage
    
    init(json: JSON) {
        name = json["name"].stringValue
        username = json["username"].stringValue
        bioText = json["bio"].stringValue
        profileImage = UIImage()
    }
}
