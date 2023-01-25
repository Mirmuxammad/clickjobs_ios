//
//  MainTBC.swift
//  ClickJobs - Page 2
//
//  Created by MIrmuxammad on 25/03/22.
//

import UIKit

class EmployeeMainTBC: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        let vacansies = UINavigationController(rootViewController: VacanciesVC.init(nibName: "VacanciesVC", bundle: nil))
        let saved = UINavigationController(rootViewController: VacanciesVC.init(nibName: "VacanciesVC", bundle: nil))
        let profile = UINavigationController(rootViewController: ProfileVC.init(nibName: "ProfileVC", bundle: nil))
        
        vacansies.title = "Vacancies"
        let vacanciesBarItem = UITabBarItem(title: "Vacancies", image: UIImage(systemName: "house.fill"), selectedImage: UIImage(systemName: "house.fill"))
        let savedBarItem = UITabBarItem(title: "Saved", image: UIImage(systemName: "bookmark"), selectedImage: UIImage(systemName: "bookmark"))
        let profileBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
        
        vacansies.tabBarItem = vacanciesBarItem
        saved.tabBarItem = savedBarItem
        profile.tabBarItem = profileBarItem
        
        UITabBar.appearance().tintColor = UIColor(red: 236/255, green: 33/255, blue: 36/255, alpha: 0.8)
        UITabBar.appearance().barTintColor = .defaultGray
        
        self.viewControllers = [vacansies, saved, profile]
        
    }
    
  
}
