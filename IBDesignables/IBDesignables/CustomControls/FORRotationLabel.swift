//
//  FORRotationLabel.swift
//  IBDesignables
//
//  Created by Felipe Ortega on 10/15/18.
//  Copyright © 2018 NA-AT. All rights reserved.
//

import UIKit

@IBDesignable class FORRotationLabel: UIButton {
    
    //MARK: - INSPECTABLE VARIABLES
    
    @IBInspectable var isClockwise: Bool = true {
        didSet {
            updateView()
        }
    }

    //MARK: - VIEW LIFECYCLE
    
    override func draw(_ rect: CGRect) {
       
        updateView()
        self.titleLabel?.layoutIfNeeded()
    }
    
    //MARK: - FUNCTIONS
    
    func updateView() {
        
        self.transform = CGAffineTransform(rotationAngle: isClockwise ? CGFloat.pi / 2 : -CGFloat.pi / 2)
    }
    
}
