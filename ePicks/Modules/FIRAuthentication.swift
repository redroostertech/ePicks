//
//  FIRAuth.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 9/17/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation
import Firebase

class FIRAuthentication {
    static let shared = FIRAuthentication()
    static var currentUser: CurrentUser!
    static var auth: Auth!
    private init() {
        FIRAuthentication.currentUser = CurrentUser()
    }
    
    func performLogin(credentials: SignInCredentials?,
                      completion: @escaping (Error?) -> Void)
    {
        guard let credentials = credentials else {
            return completion(Errors.InvalidCredentials)
        }
        Auth.auth().signIn(withEmail: credentials.email ?? "",
                           password: credentials.password ?? "")
        {
            (results, error) in
            if let error = error {
                completion(error)
            } else {
                guard let results = results else {
                    return completion(Errors.JSONResponseError)
                }
                self.retrieveUser(withId: results.user.uid,
                                  completion: {
                    (userData, error) in
                    if let error = error {
                        completion(error)
                    } else {
                        
                        guard let user = userData else {
                            return completion(Errors.JSONResponseError)
                        }
                        
                        if let resultsArray = user as? Array<[String: Any]> {
                            let resultsItem = resultsArray[0]
                            self.setUserInDefaults(withData: resultsItem)
                            completion(nil)
                        } else {
                            completion(Errors.JSONResponseError)
                        }
                    }
                })
            }
        }
    }
    
    private func retrieveUser(withId id: String, completion: @escaping (Any?, Error?) -> Void) {
        FIRRealtimeDB.shared.retrieveDataOnce(atChild: "users",
                                              whereKey: "uid",
                                              isEqualTo: id)
        {
            (results, error) in
            if let error = error {
                print("error")
                completion(nil, error)
            } else {
                completion(results, nil)
            }
        }
    }
    
    func performRegisteration(usingCredentials credentials: SignUpCredentials?,
                              andData data: [String:Any]?,
                              completion: @escaping (Error?) -> Void)
    {
        guard
            let credentials = credentials,
            var userData = data else
        {
            return completion(Errors.InvalidCredentials)
        }
        
        Auth.auth().createUser(withEmail: credentials.email ?? "",
                               password: credentials.password ?? "")
        {
            (results, error) in
            if let error = error {
                completion(error)
            } else {
                guard let results = results else {
                    return completion(Errors.JSONResponseError)
                }
                
                userData["uid"] = results.user.uid
                userData.removeValue(forKey: "password")
                
                self.createUser(withData: userData,
                                completion: {
                    (user, error) in
                    if let error = error {
                        results.user.delete(completion: nil)
                        completion(error)
                    } else {
                        guard let user = user else {
                            results.user.delete(completion: nil)
                            return completion(Errors.JSONResponseError)
                        }
                        print(user)
                        self.setUserInDefaults(withData: user)
                        completion(nil)
                    }
                })
            }
        }
    }
    
    func setUserInDefaults(withData data: [String:Any]) {
        FIRAuthentication.currentUser.defaults.setDefault(withData: data,
                                                          forKey: "authorizedUser")
    }
    
    private func createUser(withData data: [String:Any], completion: @escaping([String:Any]?, Error?) -> Void) {
        ModuleHandler.shared.firRepository.db.add(data: data,
                                                  atChild: "users")
        {
            (success, key, error) in
            if let error = error {
                completion(nil, error)
            } else {
                if (success) {
                    
                    var newData = data
                    newData["key"] = key
                    
                    print(newData)
                    
                    completion(newData, nil)
                    
                } else {
                    completion(nil, Errors.JSONResponseError)
                }
            }
        }
    }
}
