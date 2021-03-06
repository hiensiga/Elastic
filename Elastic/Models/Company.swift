//
//  Company.swift
//  Elastic
//
//  Created by Doan Phuc Hien on 12/5/18.
//  Copyright © 2018 HSG. All rights reserved.
//

import UIKit
import ObjectMapper

class Company: Mappable {

    var id: Int?
    var name: String?
    var avatarUrl: String?
    var desc: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        avatarUrl <- map["avatar_url"]
        desc <- map["description"]
    }
}
