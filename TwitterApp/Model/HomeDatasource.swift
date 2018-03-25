//
//  HomeDatasource.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 24.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let kratos = User(name: "Kratos", username: "@godofwar", bioText: "Born in the Greek city-state of Sparta, is the demigod son of Zeus and a mortal woman named Callisto", profileImage: #imageLiteral(resourceName: "profile_image"))
        let zeus  = User(name: "Zeus", username: "@godofthunder", bioText: "The youngest child of the Titan King Cronos, who ascended to become the King of Olympus and the God of the Sky Thunder, Lightning, and the Heavens.", profileImage: #imageLiteral(resourceName: "zeus"))
        return [kratos, zeus]
    }()
    
    let tweets = ["tweet1", "tweet2"]
        
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
        return users[indexPath.item]
    }
}
