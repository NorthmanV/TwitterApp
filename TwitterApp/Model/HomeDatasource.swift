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
    var tweets = [Tweet]()
    
    required init(json: JSON) throws {
        guard let usersArray = json["users"].array, let tweetsArray = json["tweets"].array else {
            throw NSError(domain: "com.akberovapps", code: 1, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON error"])
        }
        users = usersArray.map {User(json: $0)}
        tweets = tweetsArray.map {Tweet(json: $0)}
    }
        
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
