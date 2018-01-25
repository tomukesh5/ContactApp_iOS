//
//  ShowContactsAPIClient.swift
//  MyContacts
//
//  Created by webwerks on 24/01/18.
//  Copyright © 2018 Neosofttech Technologies. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ShowContactsAPIClient: NSObject {
    
    func LOGIN(completionHandler: @escaping ([Response]?) -> Void) {
        
        let url = BASE_URL + API_URL.Login
     
        REQUEST_MANAGER.withGET(endPointUrl: url) { (response) in
            if let response = response.value as? [Any] {

                var contacts = [Response]()
                for contactInfo in response {
                    let contact : Response = Response(jsonDict: contactInfo as! NSDictionary)
                    contacts.append(contact)
                }
                completionHandler(contacts)
            }
    }
}
}
