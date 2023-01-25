//
//  SSBaseTextField.swift
//  click-jobs_PersonalWork
//
//  Created by baxa on 25/03/22.
//

import Foundation
import UIKit
import SSNeumorphicView

class GeneralTextField: SSNeumorphicTextField {
    
    // MARK: - IBInspectables
    /// Corner Radius
    @IBInspectable internal var cornerRadius: CGFloat = 3 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    
    /// Border Width
    @IBInspectable internal var borderWidth: CGFloat = 1 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
   
    /// Left padding
    @IBInspectable internal var leftPadding: CGFloat = 12.0 {
        didSet {
            self.updateLeftView()
        }
    }
    
    /// Right Image Height
    @IBInspectable internal var imgRightPlaceHeight = 20 {
        didSet {
            self.updateLeftView()
        }
    }
    
    /// Right Image Width
    @IBInspectable internal var imgRightPlaceWidth = 20 {
        didSet {
            self.updateLeftView()
        }
    }
    
    /// Right Image Height
    @IBInspectable internal var imgLeftPlaceHeight = 20 {
        didSet {
            self.updateLeftView()
        }
    }
    
    /// Right Image Width
    @IBInspectable internal var imgLeftPlaceWidth = 20 {
        didSet {
            self.updateLeftView()
        }
    }
    
    /// Left Image
    @IBInspectable internal var leftImage: UIImage? {
        didSet {
            self.updateLeftView()
        }
    }
    
    @IBInspectable internal var rightPadding: CGFloat = 12.0 {
        didSet {
            self.updateRightView()
        }
    }
    
    /// Right Image
    @IBInspectable internal var rightImage: UIImage? {
        didSet {
            self.updateRightView()
        }
    }
    
    /// Placeholder Color
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            self.setPlaceholderColor()
        }
    }
    
    // MARK: - variables
    
    /// keyboardAppearanceMode default is `dark`
    var keyboardAppearanceMode: UIKeyboardAppearance = .light {
        didSet {
            self.setKeyboardAppearance()
        }
    }
    
    
    //Padding
    let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    
    // MARK: - Overrides
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setKeyboardAppearance()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupForUs()

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupForUs()

    }
    
    
    private func setupForUs() {
        self.txtDepthType = .innerShadow
        self.txtNeumorphicCornerRadius = 13
        self.txtNeumorphicShadowRadius = 0
        self.txtNeumorphicShadowOffset = .init(width: 3, height: 2)
        self.txtNeumorphicMainColor = UIColor(named: "solid")?.cgColor
//        self.placeholder = "    " + (self.placeholder ?? "")
    }
    
    // MARK: - Functions
    
    /// Set keyboard appearance
    fileprivate func setKeyboardAppearance() {
        self.keyboardAppearance = keyboardAppearanceMode
    }
    
    fileprivate func updateRightView() {
        if let image = rightImage {
            self.rightViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imgRightPlaceWidth, height: imgRightPlaceHeight))
            let view = UIView(frame: CGRect(x: 0, y: 0, width: rightPadding + imageView.bounds.width + 9, height: 0))
            imageView.center.y = view.center.y
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            view.addSubview(imageView)
            self.rightView = view
        } else if rightPadding != 0 && rightImage == nil {
            self.rightViewMode = UITextField.ViewMode.always
            self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 0))
        } else {
            self.rightViewMode = UITextField.ViewMode.never
            self.rightView = nil
        }
    }
    
    /// Update left view
    fileprivate func updateLeftView() {
        if let image = leftImage {
            self.leftViewMode = UITextField.ViewMode.always
            let imageView = UIImageView(frame: CGRect(x: Int(leftPadding), y: 0, width: imgLeftPlaceWidth, height: imgLeftPlaceHeight))
            let view = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding + imageView.bounds.width + 9, height: 0))
            imageView.center.y = view.center.y
            imageView.contentMode = .scaleAspectFit
            imageView.image = image
            view.addSubview(imageView)
            self.leftView = view
        } else if leftPadding != 0 && leftImage == nil {
            self.leftViewMode = UITextField.ViewMode.always
            self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: leftPadding, height: 0))
        } else {
            self.leftViewMode = UITextField.ViewMode.never
            self.leftView = nil
        }
    }
    
    fileprivate func setPlaceholderColor() {
        if let placeholder = placeholder, let color = placeholderColor {
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: color])
        }
    }
    
}



extension GeneralTextField {
    
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if(isSecureTextEntry){
            button.setImage(UIImage(systemName: "eye"), for: .normal)
        }
        else{
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            
        }
    }

    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.tintColor = .btnRed
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -25, bottom: 0, right: 0)
        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(8), height: CGFloat(8))
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }
    
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
    
}
