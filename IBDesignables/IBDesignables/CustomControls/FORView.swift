//
//  FORView.swift
//  FADBanorte
//
//  Created by Felipe Ortega on 7/10/18.
//  Copyright © 2018 Banorte. All rights reserved.
//

import UIKit

@IBDesignable class FORView: UIView {
    
    //MARK: - VARIABLES
    
    /// Used to specify the current FORView state (active/unactive).
    @IBInspectable var isActive: Bool = false {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify if the current FORView must be rounded or not.
    @IBInspectable var isRounded: Bool = false {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the unactive background color for the FORView.
    @IBInspectable var unactiveBackgroundColor: UIColor = UIColor.gray {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the unactive layer color for the FORView.
    @IBInspectable var unactiveLayerColor: UIColor = UIColor.darkGray {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the unactive layer width for the FORView.
    @IBInspectable var unactiveLayerWidth: CGFloat = 1 {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the active background color for the FORview.
    @IBInspectable var activeBackgroundColor: UIColor = UIColor.white {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the active layer color for the FORView.
    @IBInspectable var activeLayerColor: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    /// Used to specify the active layer width for the FORView.
    @IBInspectable var activeLayerWidth: CGFloat = 1 {
        didSet {
            updateView()
        }
    }
    
    //MARK: - VIEW LIFECYCLE

    override func draw(_ rect: CGRect) {
        
        updateView()
    }
    
    //MARK: - FUNCTIONS
    
    /// Used to update the FORView attributes.
    func updateView(){
        
        self.layer.cornerRadius = isRounded ? self.frame.height/2 : CGFloat(5)
        self.backgroundColor    = isActive ? activeBackgroundColor : unactiveBackgroundColor
        self.layer.borderWidth  = isActive ? activeLayerWidth : unactiveLayerWidth
        self.layer.borderColor  = isActive ? activeLayerColor.cgColor : unactiveLayerColor.cgColor
        self.clipsToBounds = true
    }
}
