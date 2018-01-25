//
//  Response.swift
//  MyContacts
//
//  Created by webwerks on 24/01/18.
//  Copyright © 2018 Neosofttech Technologies. All rights reserved.
//

import Foundation
class Response{

    var contactId : Int?
    var email: String!
    var userName: String?
    var contactNo : String?
    var address : [String: AnyObject]
     init(jsonDict: NSDictionary){
        self.contactId = jsonDict["id"]   as?  Int ?? 0
        self.email = jsonDict["email"]   as? String ??  ""
        self.userName = jsonDict["name"] as? String ??  ""
        self.contactNo = jsonDict["phone"] as? String ?? ""
        self.address = jsonDict["address"] as! [String: AnyObject]
    }
}
