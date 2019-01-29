//
//  User.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 9/17/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation
import ObjectMapper

class User:
    Mappable
{
    var uid: Any?
    var email: Any?
    var username: Any?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        uid <- map["uid"]
        email <- map["email"]
        username <- map["username"]
    }
    
}
