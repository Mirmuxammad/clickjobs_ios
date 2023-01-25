//
//  PasswordVC.swift
//  click-jobs_PersonalWork
//
//  Created by baxa on 25/03/22.
//
import Foundation
import UIKit
import SSNeumorphicView

class PasswordVC: UIViewController {
//    E3E6EA
    @IBOutlet var pswrdTfs: [GeneralTextField]!{
        didSet{
            for i in pswrdTfs{
                i.enablePasswordToggle()
            }
        }
    }
    
    
    @IBOutlet var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .defaultGray
        navigationController?.navigationBar.prefersLargeTitles = false
        title = "Password"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    @IBAction func changePressed(_ sender: Any) {
        let current = self.pswrdTfs[0]
        let new = self.pswrdTfs[1]
        let confirm = self.pswrdTfs[2]
        
        
        if new.text! != confirm.text! {
            //
            Alert.showAlert(forState: .error, message: "New password does not match")
        } else {
            Fire.shared.getCurrentUserDetails { user in
                if let user = user {
                    if current.text! == user.password {
                        Fire.shared.updateUserPassword(newPassword: new.text!) { done in
                            if done {
                                self.navigationController?.popViewController(animated: true)
                                Alert.showAlert(forState: .success, message: "Your password successfully changed!🎉")
                            } else {
                                Alert.showAlert(forState: .error, message: "Something went wrong, please try again")
                            }
                        }
                    } else {
                        Alert.showAlert(forState: .error, message: "Old password is wrong, please enter correct old password to update for new password")
                    }
                }
            }
        }

    }
}


