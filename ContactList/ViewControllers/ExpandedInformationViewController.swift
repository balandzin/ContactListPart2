//
//  ExpandedInformationViewController.swift
//  ContactList
//
//  Created by Антон Баландин on 14.12.23.
//

import UIKit

final class ExpandedInformationViewController: UITableViewController {
    
    var persons: [Person]!
}

extension ExpandedInformationViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        persons[section].fullName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons[section].rows.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandedCell", for: indexPath)
        
        let person = persons[indexPath.section]
        var content = cell.defaultContentConfiguration()
        content.text = person.rows[indexPath.row]
        
        if indexPath.row == 0 {
            content.image = UIImage(systemName: "phone")
        } else if indexPath.row == 1 {
            content.image = UIImage(systemName: "tray")
        }
        
        cell.contentConfiguration = content
        
        return cell
    }
}

