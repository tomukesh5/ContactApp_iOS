//
//  RequestManager.swift
//  MyContacts
//
//  Created by webwerks on 24/01/18.
//  Copyright © 2018 Neosofttech Technologies. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper
class RequestManager {
    
    //    typealias JSONCompletionHandler = (String?, RestError?) -> Void
    //    typealias completionHandler = JSONCompletionHandler
    
    class var sharedInstance :RequestManager {
        struct Singleton {
            static let instance = RequestManager()
        }
        return Singleton.instance
    }
    
    func withGET(endPointUrl: String, completionHandler: @escaping (Result<Any>) -> Void) {

         let configuration = URLSessionConfiguration.default
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        sessionManager.request(endPointUrl, method: .get, encoding: URLEncoding.methodDependent)
            .responseJSON {
                response in
                
                sessionManager.session.invalidateAndCancel()
                sessionManager.session.finishTasksAndInvalidate()
                
                switch (response.result) {
                case .success(let responseObject):
                    completionHandler(.success(responseObject))
                    break
                    
                case .failure(let error):
                    print("Response : \(response)")
                    if error._code == NSURLErrorTimedOut || error._code == NSURLErrorNotConnectedToInternet {
//                        COMMON_SETTINGS.showToast(message: ERROR_MSG.TimeOut)
//                        COMMON_SETTINGS.hideHUD()
                        completionHandler(.failure(ERROR_MSG.Unknown as! Error))
                    } else {
                        let error = RestError(code: error._code, message: error.localizedDescription)
//                        COMMON_SETTINGS.hideHUD()
//                        COMMON_SETTINGS.showToast(message: error.localizedDescription)
                        completionHandler(.failure(ERROR_MSG.Unknown as! Error))
                    }
                    break
                }
        }
    }
}
