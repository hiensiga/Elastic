//
//  RUserInfo.swift
//  Elastic
//
//  Created by HienSiGa on 3/8/19.
//  Copyright © 2019 HSG. All rights reserved.
//

import Foundation
import RealmSwift

class RUser: Object {

    @objc dynamic var id: String = ""
    @objc dynamic var token: String?
    @objc dynamic var name: String?
    @objc dynamic var givenName: String?
    @objc dynamic var familyName: String?
    @objc dynamic var email: String?
    
    convenience init(id: String, token: String? = nil, name: String? = nil, givenName: String? = nil, familyName: String? = nil, email: String? = nil) {
        self.init()
        self.id = id
        self.token = token
        self.name = name
        self.givenName = givenName
        self.familyName = familyName
        self.email = email
    }
    
    override static func primaryKey() -> String?{
        return "id"
    }
}
