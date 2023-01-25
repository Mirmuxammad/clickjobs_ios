//
//  Cache.swift
//  Clickjobs New
//
//  Created by Mustafo Asqarov on 27/03/2022.
//

import Foundation

class Cache {
    
    
    static let share: Cache = Cache()
    
    
    
    func isUserEmployer() -> Bool {
        return UserDefaults.standard.bool(forKey: Keys.isUserEmployer)
    }
    
    func getUserToken() -> String? {
        return UserDefaults.standard.string(forKey: Keys.userToken)
    }
    
    func logoutCleanUp() {
        UserDefaults.standard.set(nil, forKey: Keys.userToken)
        UserDefaults.standard.set(nil, forKey: Keys.isUserEmployer)

    }
    
    ///This method is for saving user session
    func setUser(token: String?, isEmployer: Bool) {
        UserDefaults.standard.set(token, forKey: Keys.userToken)
        UserDefaults.standard.set(isEmployer, forKey: Keys.isUserEmployer)
    }

}
