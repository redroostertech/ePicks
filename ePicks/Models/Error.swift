//
//  File.swift
//  PopViewers
//
//  Created by Michael Westbrooks II on 5/13/18.
//  Copyright © 2018 MVPGurus. All rights reserved.
//

import Foundation

enum Errors:
    String,
    Error
{
    case InvalidCredentials = "InvalidCredentials"
    case JSONResponseError = "JSONResponseError"
    case EmptyAPIResponse = "EmptyAPIResponse"
    
    //  Add additional custom errors as needed
    //  ...
    
    var localizedDescription: String {
        switch self {
        case.InvalidCredentials:
            return NSLocalizedString("\(Errors.self)_\(self)", tableName: String(describing: self), bundle: Bundle.main, value: "Invalid Credentials", comment: "")
        case.JSONResponseError:
            return NSLocalizedString("\(Errors.self)_\(self)", tableName: String(describing: self), bundle: Bundle.main, value: "There was an error converting the JSON response", comment: "")
        case.EmptyAPIResponse:
            return NSLocalizedString("\(Errors.self)_\(self)", tableName: String(describing: self), bundle: Bundle.main, value: "No data was returned from the request.", comment: "")
        }
    }
}
