//
//  UserManager.swift
//  Elastic
//
//  Created by HienSiGa on 3/8/19.
//  Copyright © 2019 HSG. All rights reserved.
//

import UIKit

class UserManager: NSObject {

    static let shared: UserManager = UserManager()
    
    public func getCurrentUser() -> RUser? {
        return RealmUtil.getAll(type: RUser.self).last
    }
    
    public func isLogin() -> Bool {
        if let user = getCurrentUser(), let token = user.token, token.count > 0 {
            return true
        }
        return false
    }
}
