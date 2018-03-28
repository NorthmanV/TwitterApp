//
//  Tweet.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 26.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        user = User(json: userJson)
        message = json["message"].stringValue
    }
}
