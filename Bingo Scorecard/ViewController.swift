//
//  ViewController.swift
//  Bingo Scorecard
//
//  Created by Karl Cridland on 13/06/2021.
//

import UIKit

var viewController: ViewController?

class ViewController: UIViewController {
    
    var credentials: Credentials?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewController = self
    }
    
    override func viewLayoutMarginsDidChange() {
        
        if let superview = self.view.superview?.superview{
            
            Settings.shared.topConstraint = superview.layoutMargins.top
            Settings.shared.bottomConstraint = superview.layoutMargins.bottom
            
            let length = self.view.frame.height
            self.credentials = Credentials(frame: CGRect(x: 0, y: 0, width: length + superview.layoutMargins.bottom, height: length))
            self.view.addSubview(self.credentials!)
            
        }
        
    }


}

