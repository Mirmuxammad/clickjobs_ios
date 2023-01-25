//
//  WalkVC.swift
//  Click_Jobs_app
//
//  Created by Macbook Air on 26/03/22.
//

import UIKit
import SSNeumorphicView

class WalkVC: UIViewController {
    

    @IBOutlet weak var backView: SSNeumorphicView! {
        didSet {
            backView.viewDepthType = .outerShadow
            backView.viewNeumorphicCornerRadius = 13
        }
    }
    
    @IBOutlet weak var v1: SSNeumorphicView! {
        didSet {
            v1.viewDepthType = .innerShadow
            v1.viewNeumorphicCornerRadius = 13
        }
    }
    
    @IBOutlet weak var v2: SSNeumorphicView! {
        didSet {
            v2.viewDepthType = .innerShadow
            v2.viewNeumorphicCornerRadius = 13
        }
    }
    
    @IBOutlet var btns: [UIButton]!  {
        didSet {
            btns[1].backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
            btns[0].backgroundColor = .clear
        }
    }
    
    
    private var isEmployer: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        self.changeSegmentState(employeer: isEmployer)
        
    }
    
    @IBAction func loginTap(_ sender: UIButton) {
        let vc = SignUpVC.init(nibName: "SignUpVC", bundle: nil)
        vc.isEmployer = self.isEmployer
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func signUpTapped(_ sender: UIButton) {
        let vc = SignInVC(nibName: "SignInVC", bundle: nil)
        vc.isEmployer = self.isEmployer
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    

    @IBAction func btnsTap(_ sender: UIButton) {
        changeSegmentState(employeer: sender.tag == 0)
        
        
    }
    
    
    
    private func changeSegmentState(employeer: Bool) {
        self.isEmployer = employeer
        if employeer {
            btns[0].backgroundColor = .clear
            btns[1].backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        } else {
            btns[1].backgroundColor = .clear
            btns[0].backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        }
    }
    

}
