//
//  ShowContactsViewController.swift
//  MyContacts
//
//  Created by webwerks on 24/01/18.
//  Copyright © 2018 Neosofttech Technologies. All rights reserved.
//

import UIKit

class ShowContactsViewController: UIViewController {

    //MARK:- Variable declaration
      var responseArray = [Response] ()
    @IBOutlet weak var tableViewContacts: UITableView!
    let viewModel: ShowContactsViewModel = ShowContactsViewModel()

    //MARK:- View life cycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        self.viewModel.getResponse(comlete: { (response) in
            if let contactsDetail = response {
                self.responseArray = contactsDetail
               let response: Response = self.responseArray[0]
                print("\(response.userName ?? "")")
                self.tableViewContacts.reloadData()
            }

        })
//     print("view model data \(responseArray)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:- Helper function
    func setUpView(){
        
        tableViewContacts.delegate = self
        tableViewContacts.dataSource = self
        tableViewContacts.register(UINib(nibName:"ShowContactsTableViewCell", bundle: nil), forCellReuseIdentifier: "ShowContactsTableViewCell")
        
    }
    
}
//MARK:- TableView Delegate

extension ShowContactsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let storyBord = UIStoryboard.init(name: "Main", bundle: nil)
        let contactsVC:ContactDetailViewController = storyBord.instantiateViewController(withIdentifier: "ContactDetailViewController") as! ContactDetailViewController
            let response: Response = self.responseArray[indexPath.row]
            var addressDict = response.address
            let street = addressDict["street"]
            print("street is \(String(describing: street))")
            let city = addressDict["city"]
             print("street is \(String(describing: city))")
            contactsVC.email = response.email
            contactsVC.street = (street as? String)!
            contactsVC.city = (city as? String)!
        
            self.navigationController?.pushViewController(contactsVC, animated: true)
    }

}
// MARK:- Tabelview Datasource

extension ShowContactsViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contactCell = tableViewContacts.dequeueReusableCell(withIdentifier: "ShowContactsTableViewCell") as! ShowContactsTableViewCell

        let response: Response = self.responseArray[indexPath.row]
        contactCell.labelName.text = response.userName
        contactCell.labelEmail.text = response.contactNo
       
     
        return contactCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
