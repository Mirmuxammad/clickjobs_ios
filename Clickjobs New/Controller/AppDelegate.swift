//
//  AppDelegate.swift
//  Clickjobs New
//
//  Created by Mustafo Asqarov on 27/03/2022.
//

import UIKit
import Firebase
import IQKeyboardManagerSwift


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow()
        
        IQKeyboardManager.shared.enable = true

        if let _ = Cache.share.getUserToken() {
            if Cache.share.isUserEmployer() {
                //EMPLOYER
                let vc = EmployerMainTBC()
                window?.rootViewController = vc
            } else {
                let vc = EmployeeMainTBC()
                window?.rootViewController = vc
            }
        } else {
            //User not logged in
            let walk = WalkVC(nibName: "WalkVC", bundle: nil)
            let vc = UINavigationController(rootViewController: walk)
            window?.rootViewController = vc
        }
        window?.makeKeyAndVisible()
        return true
    }
}

