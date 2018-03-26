//
//  HomeDatasource.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 24.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    var users = [User]()
    
    required init(json: JSON) throws {
        let array = json["users"].array
        for user in array! {
            let name = user["name"].stringValue
            let username = user["username"].stringValue
            let bio = user["bio"].stringValue
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            users.append(user)
        }
    }

    let tweets: [Tweet] = {
        let kratos = User(name: "Kratos", username: "@godofwar", bioText: "Born in the Greek city-state of Sparta, is the demigod son of Zeus and a mortal woman named Callisto", profileImage: #imageLiteral(resourceName: "profile_image"))
        let tweet1 = Tweet(user: kratos, message: "The Hands of Death could not defeat me, the Sisters of Fate could not hold me, and you will not see the end of this day!! I WILL HAVE MY REVENGE!!!")
        let tweet2 = Tweet(user: kratos, message: "You once sacrificed yourself to save Zeus, and now you seek to destroy him?! What has brought about this change?")
        return [tweet1, tweet2]
    }()
        
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
}
