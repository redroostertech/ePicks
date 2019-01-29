//
//  Configs.swift
//  Wisk_App
//
//  Created by Michael Westbrooks on 5/28/18.
//  Copyright © 2018 redroostertechnologiesinc. All rights reserved.
//

import Foundation
import UIKit

public let googleAPIKey = ""
public let awsIDPool = ""

//  Constant Strings
let AuthenticationErrorTextFieldsEmpty = "Please ensure that all fields are filled correctly."
let AuthenticationErrorWithCredentials = "It looks like the credentials you provded are invalid. Please try again."

//  UserDefaults Strings
let kLoggedIn = "loggedIn"
let kUserId = "userID"
let kAirportId = "airportID"

//  Wowza Strings
let wowzaSDKApiKey = ""
let wowzaSandboxApi = ""
let wowzaSandboxAccess = ""
let wowzaHostAddress = "54.85.201.193"
let wowzaApplicationName = "live"
let wowzaPortNumber: UInt = 1935
let wowzaUsername = "wowza"
let wowzaPassword = "i-00e9654e1f94e1837"

let kTopOfScreen = UIScreen.main.bounds.minY
let kBottomOfScreen = UIScreen.main.bounds.maxY
let kFarLeftOfScreen = UIScreen.main.bounds.minX
let kFarRightOfScreen = UIScreen.main.bounds.maxX
let kWidthOfScreen = UIScreen.main.bounds.width
let kHeightOfScreen = UIScreen.main.bounds.height

let kSearchTextFieldHeight: CGFloat = 42
let kContainerViewHeightForMyPicks: CGFloat = 225
let kRemainingHeightForContainer: CGFloat = 250
let kAnimationDuration: Double = 2.0
