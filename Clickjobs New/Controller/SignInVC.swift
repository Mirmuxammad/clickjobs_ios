//
//  LoginVC.swift
//  Click_Jobs_app
//
//  Created by Macbook Air on 26/03/22.
//

import UIKit
/// SIGN UP
class SignInVC: UIViewController {

    @IBOutlet weak var firstNameField: GeneralTextField!
    @IBOutlet weak var lastNameField: GeneralTextField!

    @IBOutlet weak var occupiedField: GeneralTextField!
    @IBOutlet weak var companyNameField: GeneralTextField!
    @IBOutlet weak var phoneField: GeneralTextField!
    @IBOutlet weak var emailField: GeneralTextField!
    @IBOutlet weak var tgField: GeneralTextField!
    @IBOutlet weak var addressField: GeneralTextField!
    @IBOutlet weak var loginField: GeneralTextField!
    @IBOutlet weak var passwordField: GeneralTextField!

    var occupied: Bool = false
    
    @IBOutlet weak var siginBtn: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var isEmployer: Bool = true
    
    var occupiedData: [String] = ["Yes", "No"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigation()
        
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        picker.selectRow(0, inComponent: 0, animated: false)

        self.occupiedField.inputView = picker
    
        
        
    }
    

    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    
    
    
    @IBAction func btnTapped(_ sender: Any) {
        
        UserDefaults.standard.set(true, forKey: "status")
              

        let user = User(id: "", firstName: firstNameField.text!, lastName: lastNameField.text!, phone: phoneField.text!, email: emailField.text!, tgUsername: tgField.text!, isOccupied: !occupied, resumeUrl: "", savedVacancies: [], login: loginField.text!, password: passwordField.text!, companyID: companyNameField.text!, isEmployer: self.isEmployer, address: self.addressField.text!)
        
        Fire.shared.registerUser(data: user) { newUser in
            if let newUser = newUser {
                if newUser.isEmployer {
                    //EMPLOYER
                    let vc = EmployerMainTBC()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                } else {
                    //EMPLOYEE
                    let vc = EmployeeMainTBC()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
            }
        }
        
    }
    
    

}


//MARK: - PICKER VIEW
extension SignInVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return occupiedData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return occupiedData[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.occupied = occupiedData[row] == "Yes"
        self.occupiedField.text = "Are you occupied: " + occupiedData[row]
    }
    
    
}


//MARK: - KEYBOARD METHODS
extension SignInVC {
    
    func setNavigation() {
        navigationItem.hidesBackButton = false
        navigationController?.navigationBar.tintColor = .btnRed
        navigationController?.navigationBar.barTintColor = .defaultGray
        self.title = "Sign up"
    }
    

}
