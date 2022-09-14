//
//  ViewController.swift
//  CoreData Task Implementation
//
//  Created by Sejal Khanna on 16/12/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var contacts: [String] = []

    @IBOutlet weak var ContactsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ContactsTableView.delegate = self
        ContactsTableView.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(rightButtonAction(_:)))

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ContactsTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contacts[indexPath.row]

        return cell
    }

    @IBAction func rightButtonAction(_ sender: Any) {
        let dialog = UIAlertController(title: "New Contact", message: "Add the contact's name", preferredStyle: .alert)
            
            dialog.addTextField()
            dialog.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            
            let addAction = UIAlertAction(title: "Add", style: .default) {
                [unowned self] action in
                
                if let contactName = dialog.textFields?.first?.text {
                    self.contacts.append(contactName)
                    self.tableView.reloadData()
                }
            }
            
            dialog.addAction(addAction)
            
            present(dialog, animated: true)
    }
    

}

