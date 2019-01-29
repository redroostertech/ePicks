//
//  SignInCredentials.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 9/18/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation
import ObjectMapper

class SignInCredentials: Mappable {
    var email: String?
    var password: String?

    required init?(map: Map) { }
    
    func mapping(map: Map) {
        email <- map["email"]
        password <- map["password"]
    }
}
