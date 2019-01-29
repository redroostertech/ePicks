//
//  ModuleHandler.swift
//  PopViewers
//
//  Created by Michael Westbrooks II on 5/13/18.
//  Copyright © 2018 MVPGurus. All rights reserved.
//

import Foundation

class ModuleHandler {
    
    static let shared = ModuleHandler()
    
    //var wowzaService: WowzaService
    var awsService: AWSService
    var apiRepository: APIRepository
    var firRepository: FIRRepository
    
    //  Add additional services as needed
    //  ...
    
    private init() {
        print("ePicks | Module Handler Initialized")
        //  self.wowzaService = WowzaService.shared
        self.awsService = AWSService.shared
        self.apiRepository = APIRepository.shared
        self.firRepository = FIRRepository.shared
        
    }
}
