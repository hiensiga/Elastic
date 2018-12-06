//
//  User.swift
//  Elastic
//
//  Created by Doan Phuc Hien on 12/6/18.
//  Copyright © 2018 HSG. All rights reserved.
//

import UIKit
import ObjectMapper

class User: Mappable {
    
    var twitterId: String?
    var twitterName: String?
    var avatarUrl: String?
    var countryCode: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        twitterId <- map["twitter_id"]
        twitterName <- map["twitter_name"]
        avatarUrl <- map["avatar_url"]
        countryCode <- map["country_code"]
    }
}
