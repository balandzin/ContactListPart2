//
//  TabBarController.swift
//  ContactList
//
//  Created by Антон Баландин on 14.12.23.
//

import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transferObject()
    }
    
    public func transferObject() {
        let persons = Person.getPersons()
        
        guard let viewControllers = viewControllers else { return }
        
        for viewController in viewControllers {
            if let personsVC = viewController as? PersonsListViewController {
                personsVC.persons = persons
            } else if let expandedVC = viewController as? ExpandedInformationViewController {
                expandedVC.persons = persons
            }
        }
    }
}
