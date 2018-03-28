//
//  Service.swift
//  TwitterApp
//
//  Created by Руслан Акберов on 26.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com/")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion:@escaping (HomeDatasource?, Error?) -> ()) {
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("/twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource, nil)
        }) { (error) in
            completion(nil, error)
        }
    }
}

class JSONError: JSONDecodable {
    required init(json: JSON) throws {
        print("JSON Error")
    }
}

