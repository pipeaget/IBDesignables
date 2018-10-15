//
//  FORButton.swift
//  FADBanorte
//
//  Created by Felipe Ortega on 7/5/18.
//  Copyright © 2018 Banorte. All rights reserved.
//

import UIKit

@IBDesignable class FORButton: UIButton {
    
    //MARK: - VARIABLES
    
    @IBInspectable var borderCornerRadius: CGFloat = 5 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var isRound: Bool = false {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the current FORButton state (active/unactive).
    @IBInspectable var isActive: Bool = false {
        didSet {
            updateView()
        }
    }
    
    /// Used to set a specific text into the component.
    @IBInspectable var displayText: String = "Insert Text here" {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the unactive background color for the FORButton.
    @IBInspectable var unActiveBackgroundColor: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the unactive border color for the FORButton.
    @IBInspectable var unActiveBorderColor: UIColor = UIColor.darkGray {
        didSet {
            updateView()
        }
    }
    
    /// Used  to specify the unactive text color for the FORButton.
    @IBInspectable var unActiveTextColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the unactive border width for the FORButton.
    @IBInspectable var unActiveBorderWidth: CGFloat = 2 {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the active background color for the FORButton.
    @IBInspectable var activeBackgroundColor: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the active border color for the FORButton.
    @IBInspectable var activeBorderColor: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the active text color for the FORButton.
    @IBInspectable var activeTextColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the active border color for the FORButton.
    @IBInspectable var activeBorderWidth: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    var indexPath: (Int, Int) = (0, 0)
    
    //MARK: - FUNCTIONS
    
    override func draw(_ rect: CGRect) {
        
        updateView()
    }
    
    /// Used to update the FORButton attributes.
    func updateView(){
        
        self.layer.cornerRadius = isRound ? self.frame.height/2 : borderCornerRadius
        self.backgroundColor = isActive ? activeBackgroundColor : unActiveBackgroundColor
        self.setTitleColor(isActive ? activeTextColor : unActiveTextColor,
                           for: UIControl.State.normal)
        self.layer.borderWidth = isActive ? activeBorderWidth : unActiveBorderWidth
        self.layer.borderColor = isActive ? activeBorderColor.cgColor : unActiveBorderColor.cgColor
        self.isUserInteractionEnabled = isActive
        self.setTitle(displayText,
                      for: UIControl.State.normal)
    }
}
