//
//  FIRFirestoreDB.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 9/18/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation
import Firebase

class FIRFirestoreDB {
    static let shared = FIRFirestoreDB()
    private var dbRef: Firestore!
    private var docRef: DocumentReference?
    private init() {
        self.dbRef = Firestore.firestore()
    }
    func add(data: [String: Any],
             to collection: String,
             completion: @escaping(Bool, String?, Error?) -> Void)
    {
        clearDocReference()
        self.docRef = self.dbRef.collection(collection).addDocument(data: data) {
            (error) in
            if let error = error {
                completion(false, nil, error)
            } else {
                completion(true, "Placeholder", nil)
            }
        }
    }
    private func clearDocReference() {
        self.docRef = nil
    }
}
