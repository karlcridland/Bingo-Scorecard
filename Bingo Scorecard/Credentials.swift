//
//  Credentials.swift
//  Bingo Scorecard
//
//  Created by Karl Cridland on 13/06/2021.
//

import Foundation
import UIKit

class Credentials: UIView{
    
    let view = UIScrollView()
    
    let email: SITextField
    let password: SITextField
    
    override init(frame: CGRect) {
        
        self.email = SITextField(frame: CGRect(x: 20, y: 50, width: frame.height-40, height: 50), title: "email address", password: false)
        self.password = SITextField(frame: CGRect(x: 20, y: 150, width: frame.height-40, height: 50), title: "password", password: true)
        
        super .init(frame: frame)
        
        self.backgroundColor = .orange
        
        [self.email,self.email.header,self.password,self.password.header].forEach { field in
            self.view.addSubview(field)
        }
        
        self.email.becomeFirstResponder()
        
        self.view.frame = CGRect(x: Settings.shared.bottomConstraint, y: 0, width: frame.height, height: frame.height)
        self.addSubview(self.view)
        self.view.contentSize = CGSize(width: self.view.frame.width, height: self.password.frame.maxY+20)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            UIView.animate(withDuration: 0.3) {
                self.view.frame = CGRect(x: Settings.shared.bottomConstraint, y: 0, width: self.view.frame.width, height: keyboardRectangle.height+50)
            }
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame = CGRect(x: Settings.shared.bottomConstraint, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class SITextField: UITextField {
    
    let header = UILabel()
    
    init(frame: CGRect, title: String, password: Bool) {
        super .init(frame: frame)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.font = .systemFont(ofSize: 18, weight: UIFont.Weight(rawValue: 0.3))
        
        self.header.frame = CGRect(x: self.frame.minX+10, y: self.frame.minY-30, width: self.frame.width-20, height: 30)
        self.header.text = title
        self.header.font = .systemFont(ofSize: 16, weight: UIFont.Weight(rawValue: 0.3))
        self.header.textColor = .white
        
        if (password){
            self.isSecureTextEntry = true
        }
    }
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
