//
//  VacanciesDesVC.swift
//  ClickJobs - Page 2
//
//  Created by MIrmuxammad on 25/03/22.
//

import UIKit
import WebKit

class VacanciesDesVC: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var saveBtn: UIButton!

    
    var url: URL = URL(string: "https://google.com")!
    var category: String = ""
    
    var vacancy: Vacancy!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBarVacansi()
        self.view.backgroundColor = .defaultGray

        self.saveBtn.setTitle("", for: .normal)
        let req = URLRequest(url: url)
        self.webView.load(req)
        self.webView.navigationDelegate = self
        self.title = category
        self.webView.isOpaque = false
        self.webView.backgroundColor = .defaultGray
        
        Fire.shared.checkVacancyInSaved(id: self.vacancy.id) { exist in
            if exist {
                self.saveBtn.setTitle("Remove from saved", for: .normal)
                self.saveBtn.tag = 1
            } else {
                self.saveBtn.setTitle("Save for later", for: .normal)
                self.saveBtn.tag = 0
            }
        }
        

    }
    
    
    @IBAction func saveForLaterPressed(_ sender: Any) {
        if self.saveBtn.tag == 0 {
            //
            Fire.shared.addVacancyToSaved(id: vacancy.id) { done in
                if done {
                    Alert.showAlert(forState: .success, message: "This vaccancy is saved to your vacancies!")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        } else {
            Fire.shared.removeVacancyFromSaved(id: vacancy.id) { done in
                if done {
                    Alert.showAlert(forState: .success, message: "This vaccancy is deleted from your vacancies!")
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }

    }
    
    @IBAction func contactPressed(_ sender: Any) {
        
        callNumber(phoneNumber: vacancy.phone)
    }
    
    
    private func callNumber(phoneNumber: String) {
        var number: String = phoneNumber
        if phoneNumber.hasPrefix("+") {
            number = "\(phoneNumber.dropFirst(1))"
        }
        guard let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) else {
            Alert.showAlert(forState: .error, message: "Can't find contact information")
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    

}



extension VacanciesDesVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        Loader.start()
    }
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        Loader.stop()
    }
}



//MARK: -UINavigationControllerBar methodos-
extension VacanciesDesVC {
    func setNavBarVacansi() {
        view.backgroundColor = .defaultGray
        title = "Vacancies"
        navigationController?.navigationBar.tintColor = .btnRed
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.backgroundColor = .defaultGray
        navigationController?.view.backgroundColor = .defaultGray
        
    }
}
