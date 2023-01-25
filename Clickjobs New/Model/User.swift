//
//  User.swift
//  Clickjobs
//
//  Created by Mustafo Asqarov on 21/03/2022.
//

import Foundation


struct User {
    
    var id: String
    var firstName: String
    var lastName: String
    var phone: String
    var email: String
    var tgUsername: String
//    var jobTitle: String
    var isOccupied: Bool
    var resumeUrl: String
    var savedVacancies: [String]
    var address: String
    var login: String
    var password: String
    
    var companyID: String
    var isEmployer: Bool
    
    init(id: String, firstName: String, lastName: String, phone: String, email: String, tgUsername: String, isOccupied: Bool, resumeUrl: String, savedVacancies: [String], login: String, password: String, companyID: String, isEmployer: Bool, address: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
        self.tgUsername = tgUsername
        self.isOccupied = isOccupied
        self.resumeUrl = resumeUrl
        self.savedVacancies = savedVacancies
        self.login = login
        self.password = password
        self.companyID = companyID
        self.isEmployer = isEmployer
        self.address = address
    }

    init(dictionaryData: [String:Any], docId: String) {
        self.id = docId
        self.firstName = (dictionaryData["firstName"] as? String) ?? ""
        self.lastName = (dictionaryData["lastName"] as? String) ?? ""
        self.phone = (dictionaryData["phone"] as? String) ?? ""
        self.email = (dictionaryData["email"] as? String) ?? ""
        self.tgUsername = (dictionaryData["tgUsername"] as? String) ?? ""
        self.isOccupied = (dictionaryData["isOccupied"] as? Bool) ?? true
        self.resumeUrl = (dictionaryData["resumeUrl"] as? String) ?? ""
        self.savedVacancies = (dictionaryData["savedVacancies"] as? [String]) ?? []
        self.login = (dictionaryData["login"] as? String) ?? ""
        self.password = (dictionaryData["password"] as? String) ?? ""
        self.companyID = (dictionaryData["companyID"] as? String) ?? ""
        self.isEmployer = (dictionaryData["isEmployer"] as? Bool) ?? false
        self.address = (dictionaryData["address"] as? String) ?? ""
    }
    
    func getDictionary() -> [String:Any] {
        return [
            "companyID":companyID,
            "email":email,
            "firstName":firstName,
            "isEmployer":isEmployer,
            "isOccupied":isOccupied,
//            "jobTitle":jobTitle,
            "lastName":lastName,
            "login":login,
            "password":password,
            "phone":phone,
            "resumeURL":resumeUrl,
            "savedVacancies": savedVacancies,
            "tgUsername":tgUsername,
            "address":address
                    
        ]
    }
        
}
