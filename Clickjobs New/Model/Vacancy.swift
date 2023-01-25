//
//  Vacancy.swift
//  Clickjobs New
//
//  Created by Mustafo Asqarov on 28/03/2022.
//

import Foundation

struct Vacancy {
    
    var id: String = ""
    var userId: String
    var infoUrl: String
    var salary: String
    var title: String
    var workAddress: String
    var category: String
    var subcategory: String
    var companyName: String
    var phone: String
    
    
    
    func getDictionary() -> [String:String] {
        return [
            "userId":userId,
            "infoUrl":infoUrl,
            "salary":salary,
            "title":title,
            "workAddress":workAddress,
            "category":category,
            "subcategory":subcategory,
            "companyName":companyName,
            "phone":phone
        ]
    }
    
    
    
}
