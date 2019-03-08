//
//  RealmUtil.swift
//  Elastic
//
//  Created by HienSiGa on 3/8/19.
//  Copyright © 2019 HSG. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUtil {
    
    static func create<T>(obj: T, update: Bool = true) where T : Object {
        let realm = try! Realm()
        try! realm.write {
            realm.add(obj, update: update)
        }
    }
    
    static func getAll<T>(type: T.Type) -> Results<T> where T : Object {
        let realm = try! Realm()
        return realm.objects(type)
    }
    
    static func clear<T>(type: T.Type) where T : Object {
        let realm = try! Realm()
        try! realm.write {
            let list = getAll(type: type)
            realm.delete(list)
        }
    }
}
