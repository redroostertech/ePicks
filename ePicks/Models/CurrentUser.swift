//
//  CurrentUser.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 9/18/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation

class CurrentUser {
    var defaults: AppDefaults!
    init() {
        self.defaults = AppDefaults()
    }
    func get(_ key: String) -> User? {
        if let defaults: [String: Any] = self.defaults.retrieveDefault(forKey: key) {
            return User(JSON: defaults)
        } else {
            return nil
        }
    }
    
    func get(_ key: String) -> [String:Any]? {
        return self.defaults.retrieveDefault(forKey: key)
    }
}
