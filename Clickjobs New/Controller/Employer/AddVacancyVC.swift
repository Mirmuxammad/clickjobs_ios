//
//  AddVacancyVC.swift
//  Clickjobs New
//
//  Created by Mustafo Asqarov on 28/03/2022.
//

import UIKit
import SSNeumorphicView

class AddVacancyVC: UIViewController {
   
    @IBOutlet weak var titleField: GeneralTextField!
    @IBOutlet weak var companyNameField: GeneralTextField!
    @IBOutlet weak var salaryField: GeneralTextField!
    @IBOutlet weak var workAddressField: GeneralTextField!
    @IBOutlet weak var urlField: GeneralTextField!
    
    @IBOutlet weak var jobCategoryBtn: SSNeumorphicButton!
    @IBOutlet weak var jobSubCategoryBtn: SSNeumorphicButton!



    private var lastCategory: String = ""
    private var lastSubcategory: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        btnsSetup()
    }
    
    
    
    
    @IBAction func categoryPressed(_ sender: Any) {
        
//        let vc = JobCategoryVC.init(nibName: "JobCategoryVC", bundle: nil)
//        vc.delegate = self
//        navigationController?.pushViewController(vc, animated: true)
//        
    }
    
    @IBAction func subCategoryPressed(_ sender: Any) {
//        let vc = SubCategoryVC.init(nibName: "SubCategoryVC", bundle: nil)
//        vc.delegate = self
//        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func createBtnTappted(_ sender: Any) {
        if let token = Cache.share.getUserToken() {
            let newV = Vacancy(userId: token, infoUrl: urlField.text!, salary: "💸 \(self.salaryField.text!)", title: self.titleField.text!, workAddress: "📍 \(self.workAddressField.text!)", category: self.lastCategory, subcategory: self.lastSubcategory, companyName: "🏢 \(self.companyNameField.text!)", phone: "+998917792221")
            
            Fire.shared.addVacancy(vac: newV) { done in
                self.alerVcSetup()
            }

        } else {
            //TODO: - LOGIN PAGE GA OTVORISH KERAK.
        }
    }

    func backButtonSetup() {
        navigationItem.backButtonTitle = "Back"
        self.navigationController?.navigationBar.tintColor = .btnRed
    }
    
    func btnsSetup() {
        jobCategoryBtn.btnDepthType = .outerShadow
        jobCategoryBtn.btnNeumorphicCornerRadius = 13
        jobCategoryBtn.btnNeumorphicShadowOffset = .init(width: 2, height: 2)
        jobCategoryBtn.btnNeumorphicShadowRadius = 0
        jobCategoryBtn.btnNeumorphicLayerMainColor = UIColor(named: "defaultGray")?.cgColor
        
        jobSubCategoryBtn.btnDepthType = .outerShadow
        jobSubCategoryBtn.btnNeumorphicCornerRadius = 13
        jobSubCategoryBtn.btnNeumorphicShadowOffset = .init(width: 2, height: 2)
        jobSubCategoryBtn.btnNeumorphicShadowRadius = 0
        jobSubCategoryBtn.btnNeumorphicLayerMainColor = UIColor(named: "defaultGray")?.cgColor
        
     
    }
    
    }

////MARK: Calling protocol
//extension AddVacancyVC: JobCategoryVCDelegate {
//    func jobcategoryTapped(choseJob: JobCategory) {
//        self.jobCategoryBtn.setTitle(choseJob.jobType, for: .normal)
//    }
//}
//
//extension AddVacancyVC: SubCategoryVCDelegate {
//    func jobcategoryTapped(choseJob: Techlogy) {
//        self.jobSubCategoryBtn.setTitle(choseJob.techname, for: .normal)
//    }
//}

//MARK: Aler vc Setup
extension AddVacancyVC {
    func alerVcSetup() {
        
        let alert = UIAlertController(title: "Created!", message: "The vacancy has been created!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Back to menu", style: .destructive, handler: { (_) in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true, completion: {
            })
    }
}


