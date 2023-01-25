//
//  SettingsVC.swift
//  Clickjobs New
//
//  Created by user1 on 05/04/22.
//

import UIKit
import SSNeumorphicView

class SettingsVC: UIViewController {

    @IBOutlet weak var logoutBtn: UIButton!
    @IBOutlet var views: [SSNeumorphicView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewsSetup()
        navSetup()
       
    }

    func viewsSetup() {
        for i in views {
            i.viewDepthType = .outerShadow
            i.viewNeumorphicCornerRadius = 13
            i.viewNeumorphicShadowRadius = 0
            i.viewNeumorphicShadowOffset = .init(width: 2, height: 2)
            i.viewNeumorphicMainColor = UIColor(named: "defaultGray")?.cgColor
        }
        self.view.backgroundColor = .defaultGray
        logoutBtn.backgroundColor = .btnRed
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func navSetup() {
        title = "Settings"
        self.view.backgroundColor = .defaultGray
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    @IBAction func changePassTapped(_ sender: Any) {
        let vc = PasswordVC.init(nibName: "PasswordVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func notificationBtnTapped(_ sender: Any) {
        let vc = NotificationsVC.init(nibName: "NotificationsVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func languageBtnTapped(_ sender: Any) {
        let vc = LanguagesVC.init(nibName: "LanguagesVC", bundle: nil)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func logoutBtbTapped(_ sender: Any) {
        alerVcSetup()
        
    }
}

//MARK: Aler vc Setup
extension SettingsVC {
    func alerVcSetup() {
        
        let alert = UIAlertController(title: "Log out", message: "When you log out, your data will be deleted from your device.", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { (_) in
            let walk = WalkVC(nibName: "WalkVC", bundle: nil)
            let vc = UINavigationController(rootViewController: walk)
            vc.modalPresentationStyle = .fullScreen
            Cache.share.logoutCleanUp()
            self.present(vc, animated: true)
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { (_) in
            self.dismiss(animated: true, completion: nil)
        }))

        self.present(alert, animated: true, completion: {

            })
    }
}
