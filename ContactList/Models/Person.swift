//
//  Person.swift
//  ContactList
//
//  Created by Антон Баландин on 14.12.23.
//

struct Person {
    
    let name: String
    let surname: String
    let telephone: String
    let email: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getPersons() -> [Person] {
        
        var contacts:[Person] = []
        let dataStore = DataStore.shared
        
        let names = dataStore.names.shuffled()
        let surnames = dataStore.surnames.shuffled()
        let telephones = dataStore.telephones.shuffled()
        let emails = dataStore.emails.shuffled()

            let iterationCount = min(
                names.count,
                surnames.count,
                telephones.count,
                emails.count
            )
            
            for index in 0..<iterationCount {
                
                let person = Person(
                    name: names[index],
                    surname: surnames[index],
                    telephone: telephones[index],
                    email: emails[index]
                )
                contacts.append(person)
            }
        
        return contacts
    }
}
