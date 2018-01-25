//
//  CommonSettings.swift
//  MyContacts
//
//  Created by webwerks on 24/01/18.
//  Copyright © 2018 Neosofttech Technologies. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
class CommonSettings: NSObject {
    class var sharedInstance :CommonSettings {
        struct Singleton {
            static let instance = CommonSettings()
        }
        return Singleton.instance
    }
    func isConnectedToInternet() -> Bool {
        if NetworkReachabilityManager()!.isReachable {
            return true
        } else {
//            self.showToast(type: AlertBarType.error, message: MESSAGE.noInternet)
            return false
        }
    }
}
