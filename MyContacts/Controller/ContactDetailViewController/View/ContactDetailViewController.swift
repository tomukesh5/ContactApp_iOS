//
//  ContactDetailViewController.swift
//  MyContacts
//
//  Created by webwerks on 24/01/18.
//  Copyright © 2018 Neosofttech Technologies. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController {

    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelStreet: UILabel!
    @IBOutlet weak var labelCity: UILabel!

    var  email = ""
    var  street = ""
    var  city = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelEmail.text = email
        labelStreet.text = street
        labelCity.text = city
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Helper function

}
