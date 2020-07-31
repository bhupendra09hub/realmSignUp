//
//  RealmModel.swift
//  RealmSignUpDemo
//
//  Created by mac on 30/07/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import RealmSwift
class Users:Object {
    @objc dynamic var uName:String = ""
    @objc dynamic var uId:String = ""
    @objc dynamic var upwd:String = ""
    
    override class func primaryKey() -> String {
        return "uId"
    }
}
