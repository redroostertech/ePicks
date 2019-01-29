//
//  FIRRealtimeDB.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 9/17/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation
import Firebase

class FIRRealtimeDB {
    static let shared = FIRRealtimeDB()
    private var dbRef: DatabaseReference!
    private init() {
        self.dbRef = Database.database().reference()
    }
    func retrieveDataOnce(atChild child: String, completion: @escaping ([Any]?, Error?) -> Void) {
        self.dbRef.child(child).observeSingleEvent(of: .value) {
            (snapshot) in
            guard
                let item = snapshot.value as? Array<[String: Any]> else {
                    print(snapshot.value)
                    print("snapshot children count = ", snapshot.childrenCount)
                    return completion(nil, Errors.EmptyAPIResponse)
            }
            completion(item, nil)
        }
    }
    func retrieveDataOnce(atChild child: String, whereKey key: String, isEqualTo value: String, completion: @escaping (Any?, Error?) -> Void) {
        print(child, key, value)
        self.dbRef.child(child).queryOrdered(byChild: key).queryEqual(toValue: value).observeSingleEvent(of: .value, with: {
            (snapshot) in
            
            //  print(snapshot.value)
            //  print("Snapshot children count = ", snapshot.childrenCount)
            //  print("Snapshot key = ", snapshot.key)
            
            if snapshot.childrenCount > 0 {
                var arrayOfObjects = [Any]()
                for i in snapshot.children.allObjects {
                    guard
                        let data = i as? DataSnapshot,
                        let item = data.value as? [String:Any] else
                    {
                        return completion(nil, Errors.EmptyAPIResponse)
                    }
                    
                    var newDictionary = item
                    newDictionary["key"] = data.key
                    
                    arrayOfObjects.append(newDictionary)
                }
                completion(arrayOfObjects, nil)
            } else {
                return completion(nil, Errors.EmptyAPIResponse)
            }
            
        }){
            (error) in
            print("Failed to get snapshot", error.localizedDescription)
        }
    }
    func add(data: [String: Any], atChild child: String, completion: @escaping (Bool, String, Error?) -> Void) {
        self.dbRef.child(child).childByAutoId().setValue(data) {
            (error: Error?, ref: DatabaseReference) in
            if let error = error {
                completion(false, "", error)
            } else {
                completion(true, ref.key, nil)
            }
        }
    }
    
}
