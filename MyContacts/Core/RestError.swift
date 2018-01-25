//
//  RestError.swift
//  MyContacts
//
//  Created by webwerks on 24/01/18.
//  Copyright © 2018 Neosofttech Technologies. All rights reserved.
//

import Foundation
import UIKit
public struct ERROR_MSG {
    
    static let Unknown = "Unknown error occurred."
    static let Wrong = "Something went wrong."

}

class RestError: Error {
    
    public var code: Int = -1
    public var message: String = ERROR_MSG.Unknown
    
    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
}
