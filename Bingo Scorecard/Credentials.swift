//
//  Credentials.swift
//  Bingo Scorecard
//
//  Created by Karl Cridland on 13/06/2021.
//

import Foundation
import UIKit

class Credentials: UIView{
    
    let view = UIView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.view.backgroundColor = .red
        self.view.frame = CGRect(x: Settings.shared.bottomConstraint, y: 0, width: frame.height, height: frame.height)
        self.addSubview(self.view)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
