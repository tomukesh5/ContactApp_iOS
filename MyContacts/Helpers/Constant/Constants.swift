//
//  Constants.swift
//  MyContacts
//
//  Created by webwerks on 24/01/18.
//  Copyright © 2018 Neosofttech Technologies. All rights reserved.
//

import Foundation
import UIKit
typealias isCompleted = () -> ()
typealias JSONCompletionHandler = (String?) -> Void
typealias completionHandler = JSONCompletionHandler
let REQUEST_MANAGER = RequestManager.sharedInstance
let COMMON_SETTINGS = CommonSettings.sharedInstance
