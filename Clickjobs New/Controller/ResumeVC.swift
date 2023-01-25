//
//  ResumeVC.swift
//  ClickJobs
//
//  Created by Macbook on 25/03/22.
//

import UIKit
import SSNeumorphicView

class ResumeVC: UIViewController {
    
    
    @IBOutlet weak var scrolllView: UIScrollView!
    
    @IBOutlet weak var createBtn: UIButton!
    
    @IBOutlet weak var descriptionVieww: SSNeumorphicView!{
        didSet{
            addSSNeumorphicView(vieww: descriptionVieww)
        }
    }
    
    
    @IBOutlet weak var expertBtn: SSNeumorphicButton!{
        didSet{
            
            addSSNeumorphicButton(button: expertBtn)
        }
    }
    
    

    
 
    
 
    
    @IBOutlet weak var categoryBtn: SSNeumorphicButton! {
        didSet{
            
         addSSNeumorphicButton(button: categoryBtn)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Resume"
        self.view.backgroundColor = .defaultGray
        navigationController?.navigationBar.barTintColor = .defaultGray
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
            let h = keyboardSize.height - (self.view.frame.maxY - createBtn.frame.maxY)
         
            if h > 0 {
                self.scrolllView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.scrolllView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
    }
 

    func addSSNeumorphicButton(button: SSNeumorphicButton) {
        button.btnNeumorphicShadowOffset = .init(width: -2, height: -2)
        button.btnNeumorphicShadowRadius = 2
        button.btnNeumorphicCornerRadius = 12
        button.btnNeumorphicDarkShadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.20124635)
        button.btnNeumorphicLightShadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7992854845)
        button.backgroundColor = .defaultGray
        button.btnDepthType = .outerShadow
    }
    
    func addSSNeumorphicView(vieww: SSNeumorphicView) {
        vieww.viewNeumorphicShadowOffset = .init(width: 2, height: 2)
        vieww.viewNeumorphicShadowRadius = 2
        vieww.viewNeumorphicCornerRadius = 12
        vieww.viewNeumorphicDarkShadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1991551886)
        vieww.viewNeumorphicLightShadowColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.7981303638)
        vieww.backgroundColor = .defaultGray
        vieww.viewDepthType = .innerShadow
    }
    
    
    
    @IBAction func jobCategoryPressed(_ sender: Any) {
        print("job category tapped")
  
     
    }
    

    @IBAction func jobExpertisePressed(_ sender: Any) {
        print("job expertise tapped")
        
    }
    
    
    @IBAction func addPressed(_ sender: Any) {
        print("add tapped")
    }
    
    
    @IBAction func createPressed(_ sender: Any) {
        print("createPressed")
    }
    
    
}
