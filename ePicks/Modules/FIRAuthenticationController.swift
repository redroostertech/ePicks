//
//  FIRAuthenticationController.swift
//  ePicks
//
//  Created by Michael Westbrooks on 10/6/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation

class FIRAuthenticationController {
    var authenticationModule: FIRAuthentication!
    init() {
        self.authenticationModule = ModuleHandler.shared.firRepository.auth
    }
    func beginRegistration(_ params: [String:Any],
                           completion: @escaping (Bool, Error?)-> Void)
    {
        transFormParams(params) {
            (credentials) in
            self.authenticationModule.performRegisteration(usingCredentials: credentials,
                                                           andData: params,
                                                           completion:
                {
                    (error) in
                    if let error = error {
                        completion(false, error)
                    } else {
                        completion(true, nil)
                    }
            })
        }
    }
    
    private func transFormParams(_ params: [String:Any],
                                 callback: (SignUpCredentials) -> Void)
    {
        callback(SignUpCredentials(JSON: params)!)
    }
    
    func beginLogin(_ params: [String:Any],
                    completion: @escaping (Bool, Error?)-> Void)
    {
        transFormParams(params) {
            (credentials) in
            self.authenticationModule.performLogin(credentials: credentials, completion: {
                (error) in
                if let error = error {
                    completion(false, error)
                } else {
                    completion(true, nil)
                }
            })
        }
    }
    
    private func transFormParams(_ params: [String:Any],
                                 callback: (SignInCredentials) -> Void)
    {
        callback(SignInCredentials(JSON: params)!)
    }
}
