//
//  ShowContactsViewModel.swift
//  MyContacts
//
//  Created by webwerks on 24/01/18.
//  Copyright © 2018 Neosofttech Technologies. All rights reserved.
//

import Foundation
import Alamofire
class ShowContactsViewModel : NSObject {
    var responseArray = [Response] ()
    let APIClient : ShowContactsAPIClient
    init(apiClient: ShowContactsAPIClient = ShowContactsAPIClient()) {
        self.APIClient = apiClient
    }
    
    //Login
    func getResponse(comlete: @escaping ([Response]?)  -> Void) {
        
        if COMMON_SETTINGS.isConnectedToInternet() {
          //  COMMON_SETTINGS.showHUD()
            
            APIClient.LOGIN(completionHandler: { (response) in

                if let contactsDetail = response {
                    for contact: Response in contactsDetail {
                        print(contact.userName ?? "")
                      self.responseArray.append(contact)
                    }
                    
                //    print("response array is\(self.responseArray)")
                 
                }
              comlete(self.responseArray)      
               
            })
        }
    }
}
