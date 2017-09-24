//
//  Constance.swift
//  Smack
//
//  Created by Georg on 21.09.17.
//  Copyright © 2017 Georg. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// MARK: Conatants
let BASE_URL = "https://chatforsmack.herokuapp.com/"
let URL_REGISTER = "\(BASE_URL)account/register"
// MARK: Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// MARK: User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN = "loggedIn"
let USER_EMAIL = "userEmail"
