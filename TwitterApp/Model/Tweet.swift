//
//  Tweet.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 26.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["users"]
        user = User(json: userJson)
        message = json["message"].stringValue
    }
}
