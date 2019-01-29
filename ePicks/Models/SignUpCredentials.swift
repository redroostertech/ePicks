//
//  SignUpCredentials.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 9/18/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation
import ObjectMapper

class SignUpCredentials: Mappable {
    var email: String?
    var password: String?
    
    var username: String?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        email <- map["email"]
        password <- map["password"]
        username <- map["username"]
    }
}
