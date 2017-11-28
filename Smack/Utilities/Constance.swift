//
//  Constance.swift
//  Smack
//
//  Created by Georg on 21.09.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// MARK: URL Const
let BASE_URL = "https://badguysgang.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_USER_ADD = "\(BASE_URL)user/add"
let URL_USER_BY_EMAIL = "\(BASE_URL)user/byEmail/"
let URL_GET_CHANNELS = "\(BASE_URL)channel/"
let URL_GET_MESSAGES = "\(BASE_URL)message/byChannel"

// MARK: Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"

// MARK: User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN = "loggedIn"
let USER_EMAIL = "userEmail"

// MARK: Notifications
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")
let NOTIF_CHANNELS_LOADED = Notification.Name("channelsLoaded")
let NOTIF_CHANNEL_SELECTED = Notification.Name("channelSelected")

// MARK: Headers
let HEADER = [
    "Content-Type" : "application/json; charset=utf-8"
]

let BEARER_HEADER = [
    "Authorization" : "Bearer \(AuthService.instance.authToken)",
    "Content" : "application/json; charset=utf-8"
]
// MARK: Colors
let SMACK_PLACEHOLDER = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 0.5016415836)
