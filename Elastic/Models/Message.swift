//
//  Message.swift
//  Elastic
//
//  Created by Doan Phuc Hien on 12/6/18.
//  Copyright © 2018 HSG. All rights reserved.
//

import UIKit
import ObjectMapper

class Message: Mappable {
    
    var id: String?
    var publishedAt: Date?
    var content: String?
    var company: [Company]?
    var publishedBy: User?
    var lang: String?
    var url: String?
    var createdAt: Date?
    var htmlContent: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["_id"]
        publishedAt <- map["published_at"]
        content <- map["content"]
        company <- map["company_org"]
        publishedBy <- map["published_by"]
        lang <- map["lang"]
        url <- map["url"]
        createdAt <- (map["created_at"], DateTransform())
        htmlContent <- map["html_content"]
        
    }
}
