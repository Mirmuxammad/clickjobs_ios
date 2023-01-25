//
//  EmployessDetailVC.swift
//  ClickJobs_NewProject
//
//  Created by Sherzod on 25/03/22.
//

import UIKit

class EmployessDetailVC: UIViewController {
    
    
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var jobTypeLbl: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var workExperienceLbl: UILabel!
    
    
    @IBOutlet var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    func setup() {
        self.navigationController?.navigationBar.tintColor = .btnRed
        self.view.backgroundColor = .defaultGray
        navigationItem.largeTitleDisplayMode = .never
        containerView.backgroundColor = .defaultGray
        self.navigationController?.navigationBar.barTintColor = .defaultGray
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
    }
    
    @IBAction func saveForBtnPressed(_ sender: Any) {
        print("Save for later")
    }
    
    @IBAction func contactBtnPressed(_ sender: Any) {
        print("Contact")
    }
    
    
}
