//
//  Fire.swift
//  Clickjobs New
//
//  Created by Mustafo Asqarov on 27/03/2022.
//

import Foundation
import Firebase

class Fire {
    
    static var shared: Fire = Fire()
    
    private var db = Firestore.firestore()
    
    
    ///DONE
    func registerUser(data: User, createdUser: @escaping (User?) -> Void) {
        
        Loader.start()
        
        self.isUserExist(login: data.login, password: data.password, isEmployer: data.isEmployer, withLoader: false) { isUserExist in
            if isUserExist {
                print("User already exists")
                createdUser(nil)
                Alert.showAlert(forState: .error, message: "User with \(data.login) is already exists", duration: 3, userInteration: true)
                Loader.stop()
            } else {
                //Create new user
                var ref: DocumentReference? = nil
                ref = self.db.collection("user").addDocument(data: data.getDictionary()) { err in
                    Loader.stop()
                    
                    if let err = err {
                        print("Error adding document: \(err)")
                        createdUser(nil)
                        Alert.showAlert(forState: .error, message: "Unknown error occured, please try again", duration: 3, userInteration: true)
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                        
                        Alert.showAlert(forState: .success, message: "Welcome to the board!", duration: 3, userInteration: true)
                        var newU = data
                        newU.id = ref!.documentID
                        Cache.share.setUser(token: ref!.documentID, isEmployer: data.isEmployer)
                        createdUser(newU)
                    }
                }
            }
        }

    }
    
    
    ///DONE
    func isUserExist(login: String, password: String, isEmployer: Bool, withLoader: Bool = true, completion: @escaping (Bool) -> Void) {
        let users = db.collection("user")
        
        if withLoader {Loader.start()}

        // Create a query against the collection.
        let _ = users.whereField("login", isEqualTo: login).whereField("password", isEqualTo: password).whereField("isEmployer", isEqualTo: isEmployer).getDocuments { snapshot, error in
            
            if withLoader {Loader.stop()}
            
            if let snap = snapshot {
                if snap.documents.isEmpty {
                    completion(false)
                    if withLoader {
                        Alert.showAlert(forState: .error, message: "User with these crendentials not found!", duration: 3, userInteration: true)
                    }
                } else {
                    print("✅")
                    completion(true)
                    let doc1 = snap.documents.first!.data()

                    Cache.share.setUser(token: snap.documents.first!.documentID, isEmployer: doc1["isEmployer"] as? Bool ?? false)
                    
                }
            } else {
                Alert.showAlert(forState: .error, message: "Unknown error occured, please try again", duration: 3, userInteration: true)
                print("XATO, KIROLMAYSAN")
                completion(false)
            }
        }
    }
    
    
    func getCurrentUserDetails(user: @escaping (User?)->Void) {
        
        if let token = Cache.share.getUserToken() {
            Loader.start()
            let users = db.collection("user").document(token)
            users.getDocument { snapshot, error in
                Loader.stop()
                if let snap = snapshot {
                    if let doc1 = snap.data() {
                        let newUser = User.init(dictionaryData: doc1, docId: snap.documentID)
                        user(newUser)
                    } else {
                        user(nil)
                    }
                    
                } else {
                    user(nil)
                }
            }
            
        } else {
            user(nil)
        }

    }
    
    func updateUserData(firstName: String, lastName: String, phone: String, email: String, company: String, address: String, completion: @escaping (Bool)->Void) {
        
        if let token = Cache.share.getUserToken() {
            Loader.start()
            let users = db.collection("user").document(token)
            
            users.getDocument { snapshot, error in
                Loader.stop()
                if let snap = snapshot {
                    let ref = snap.reference
                    ref.updateData([
                            "firstName":firstName,
                            "lastName":lastName,
                            "phone":phone,
                            "email":email,
                            "address":address,
                            "companyID":company
                    ])
                    completion(true)
                        
                    
                } else {
                    completion(false)
                }
            }
            
        } else {
            completion(false)
        }

    }
    
    
    
    func updateUserPassword(newPassword: String, completion: @escaping (Bool)->Void) {
        
        if let token = Cache.share.getUserToken() {
            Loader.start()
            let users = db.collection("user").document(token)
            
            users.getDocument { snapshot, error in
                Loader.stop()
                if let snap = snapshot {
                    let ref = snap.reference
                    ref.updateData([
                            "password":newPassword
                    ])
                    completion(true)
                        
                    
                } else {
                    completion(false)
                }
            }
            
        } else {
            completion(false)
        }

    }
    
    func checkVacancyInSaved(id: String, completion: @escaping (Bool)->Void) {
        
        if let token = Cache.share.getUserToken() {
            Loader.start()
            let users = db.collection("user").document(token)
            
            users.getDocument { snapshot, error in
                Loader.stop()
                if let snap = snapshot {
                    let user = User.init(dictionaryData: snap.data() ?? [:], docId: snap.documentID)
                    
                    if user.savedVacancies.contains(id) {
                        completion(true)
                    } else {
                        completion(false)
                    }
                    
                    
                } else {
                    completion(false)
                }
            }
            
        } else {
            completion(false)
        }

    }

    
    func addVacancyToSaved(id: String, completion: @escaping (Bool)->Void) {
        
        if let token = Cache.share.getUserToken() {
            Loader.start()
            let users = db.collection("user").document(token)
            
            users.getDocument { snapshot, error in
                Loader.stop()
                if let snap = snapshot {
                    let user = User.init(dictionaryData: snap.data() ?? [:], docId: snap.documentID)
                    let ref = snap.reference
                    
                    var vacancies = user.savedVacancies
                    vacancies.append(id)
                    
                    ref.updateData([
                            "savedVacancies":vacancies
                    ])
                    completion(true)

                    
                } else {
                    completion(false)
                }
            }
            
        } else {
            completion(false)
        }

    }

    func removeVacancyFromSaved(id: String, completion: @escaping (Bool)->Void) {
        
        if let token = Cache.share.getUserToken() {
            Loader.start()
            let users = db.collection("user").document(token)
            
            users.getDocument { snapshot, error in
                Loader.stop()
                if let snap = snapshot {
                    let user = User.init(dictionaryData: snap.data() ?? [:], docId: snap.documentID)
                    let ref = snap.reference
                    
                    var vacancies = user.savedVacancies
                    
                    for i in vacancies.enumerated() {
                        if i.element == id {
                            vacancies.remove(at: i.offset)
                            break
                        }
                    }
                    
                    
                    ref.updateData([
                            "savedVacancies":vacancies
                    ])
                    completion(true)

                    
                } else {
                    completion(false)
                }
            }
            
        } else {
            completion(false)
        }

    }

    
    func addVacancy(vac: Vacancy, done: @escaping (Bool) -> Void) {
        
        var ref: DocumentReference? = nil
        Loader.start()
        ref = self.db.collection("vacancy").addDocument(data: vac.getDictionary()) { err in
            Loader.stop()
            
            if let err = err {
                print("Error adding document: \(err)")
                done(false)
                Alert.showAlert(forState: .error, message: "Unknown error occured, please try again", duration: 3, userInteration: true)
            } else {
                print("Document added with ID: \(ref!.documentID)")
                
                Alert.showAlert(forState: .success, message: "Your vacancy sent to the developers!", duration: 3, userInteration: true)
                done(true)
            }
        }
    }
    
    
    func getVacancyies(newVacs: @escaping ([Vacancy]) -> Void) {
        self.db.collection("vacancy").addSnapshotListener { snapshot, err in
            if let err = err {
                Alert.showAlert(forState: .error, message: "Error getting data", duration: 2, userInteration: true)
//                print(err)
            } else {
//                print("✅")
//                print(snapshot?.documents)
                var vacs: [Vacancy] = []
                
                for doc in snapshot!.documents {
                    let doc1 = doc.data() as! [String:String]
                    let v = Vacancy.init(userId: doc1["userId"]!, infoUrl: doc1["infoUrl"]!, salary: doc1["salary"]!, title: doc1["title"]!, workAddress: doc1["workAddress"]!, category: doc1["category"]!, subcategory: doc1["subcategory"]!, companyName: doc1["companyName"]!, phone: doc1["phone"] ?? "")
                    vacs.append(v)
                }
                newVacs(vacs)
            }
        }
    }
    
    
    
    
    
    
}
