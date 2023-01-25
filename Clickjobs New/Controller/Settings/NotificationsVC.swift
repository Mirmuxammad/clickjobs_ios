//
//  NotificationsVC.swift
//  click-jobs_PersonalWork
//
//  Created by baxa on 26/03/22.
//

import UIKit
import SSNeumorphicView

class NotificationsVC: UIViewController {
    
//    EBECF0    --man tanlagan E3E6EA--
    
    @IBOutlet weak var btn1: UISwitch!
    
    @IBOutlet var numorficViews: [SSNeumorphicView]!
    {
        didSet{
            for i in numorficViews{
                i.viewDepthType = .innerShadow
                i.viewNeumorphicCornerRadius = 13
                i.viewNeumorphicShadowRadius = 0
                i.viewNeumorphicShadowOffset = .init(width: 3, height: 2)
                i.viewNeumorphicMainColor = UIColor(named: "defaultGray")?.cgColor
            }
        }
    }
    @IBOutlet var switchBtns: [UISwitch]!{
        didSet{
            for i in switchBtns{
                i.onTintColor = .lightGray.withAlphaComponent(0.000001)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Notifications"
        navigationItem.backBarButtonItem?.title = "Hello"
        navigationController?.navigationBar.prefersLargeTitles = false
        self.view.backgroundColor = .defaultGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
        for i in switchBtns.enumerated(){
            if i.offset == sender.tag{
                if i.element.isOn == true {
                    i.element.thumbTintColor = .btnRed
                    i.element.isOn = true

                }
                else{
                   
                    i.element.thumbTintColor = .defaultGray.withAlphaComponent(20)
                    i.element.isOn = false

                }
            }

        }
    }
}
