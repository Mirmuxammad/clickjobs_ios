//
//  SiginVC.swift
//  Click_Jobs_app
//
//  Created by Macbook Air on 26/03/22.
//

import UIKit

class SignUpVC: UIViewController {
    

    
    @IBOutlet weak var usernameTxtFld: GeneralTextField!
    
    @IBOutlet weak var passwordTxtFld: GeneralTextField!
    
    
    var isEmployer: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    @IBAction func gestureTap(_ sender: Any) {
        usernameTxtFld.resignFirstResponder()
        passwordTxtFld.resignFirstResponder()
    }
    
    
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if usernameTxtFld.text!.count > 4 && passwordTxtFld.text!.count > 5 {
            Fire.shared.isUserExist(login: usernameTxtFld.text!, password: passwordTxtFld.text!, isEmployer: self.isEmployer) { done in
                if done {
                    if self.isEmployer {
                        let vc = EmployerMainTBC()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    } else {
                        let vc = EmployeeMainTBC()
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true)
                    }

                }
            }

        } else {
            Alert.showAlert(forState: .warning, message: "Username should be at least 4 letters and password should be at least 6 characters", duration: 4, userInteration: true)
        }
    }
    
    
    func setNavBar() {
        navigationController?.navigationBar.tintColor = .btnRed
        navigationController?.navigationBar.barTintColor = .defaultGray
        navigationItem.hidesBackButton = false
    }
    
}
