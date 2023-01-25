//
//  EmployerMainTBC.swift
//  Clickjobs New
//
//  Created by Mustafo Asqarov on 28/03/2022.
//

import UIKit

class EmployerMainTBC: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    
    private func setup() {
        let vacansies = UINavigationController(rootViewController: VacanciesVC.init(nibName: "VacanciesVC", bundle: nil))
        let plus = UINavigationController(rootViewController: AddVacancyVC.init(nibName: "AddVacancyVC", bundle: nil))
        let profile = UINavigationController(rootViewController: ProfileVC.init(nibName: "ProfileVC", bundle: nil))
        
        vacansies.title = "Vacancies"
        let vacanciesBarItem = UITabBarItem(title: "Employees", image: UIImage(systemName: "house.fill"), selectedImage: UIImage(systemName: "house.fill"))
        let savedBarItem = UITabBarItem(title: "Add Vacancy", image: UIImage(systemName: "plus"), selectedImage: UIImage(systemName: "plus"))
        let profileBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
        
        vacansies.tabBarItem = vacanciesBarItem
        plus.tabBarItem = savedBarItem
        profile.tabBarItem = profileBarItem
        
        UITabBar.appearance().tintColor = UIColor(red: 236/255, green: 33/255, blue: 36/255, alpha: 0.8)
        UITabBar.appearance().barTintColor = .defaultGray
        
        self.viewControllers = [vacansies, plus, profile]
        
    }
    
 
}
