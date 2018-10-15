//
//  FORSelectionButton.swift
//  test
//
//  Created by Felipe Ortega on 7/30/18.
//  Copyright © 2018 Felipe Ortega. All rights reserved.
//

import UIKit

protocol FORSelectionButtonDelegate {
    
    func didChangeSelectionStatus(_ sender: FORSelectionButton)
}

@IBDesignable class FORSelectionButton: UIView {
    
    //MARK: - INSPECTABLE VARIABLES
    
    @IBInspectable var isActive: Bool = false {
        didSet {
            updateView()
            delegate?.didChangeSelectionStatus(self)
        }
    }
    
    @IBInspectable var displayText: String = "Active" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var activeImage: UIImage?{
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var activeTintColor: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var activeTextColor: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var activeFont: UIFont = UIFont.systemFont(ofSize: 16,
                                                                weight: UIFont.Weight.regular) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var unactiveImage: UIImage?{
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var unactiveTintColor: UIColor = UIColor.black {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var unactiveTextColor: UIColor = UIColor.lightText {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var unactiveFont: UIFont = UIFont.systemFont(ofSize: 16,
                                                                weight: UIFont.Weight.light) {
        didSet {
            updateView()
        }
    }
    
    //MARK: - VARIABLES
    
    var delegate: FORSelectionButtonDelegate?
    
    //MARK: - OUTLETS
    
    var imgvwSelection: UIImageView!
    var lblTitle: UILabel!

    //MARK: - VIEW LIFECYCLE
    
    override func draw(_ rect: CGRect) {
        
        updateView()
    }
    
    //MARK: - FUNCTIONS

    func updateView() {
        
        self.subviews.forEach{$0.removeFromSuperview()}
        
        let viewWidth: CGFloat = self.frame.width
        self.backgroundColor = UIColor.clear
        
        imgvwSelection = UIImageView(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: 25,
                                                   height: self.frame.height))
        
        if  let imgActive: UIImage = activeImage,
            let imgUnactive = unactiveImage {
            
            let imgToDisplay: UIImage = isActive ? imgActive : imgUnactive
            imgToDisplay.withRenderingMode(UIImage.RenderingMode.alwaysTemplate)
            imgvwSelection.image = imgToDisplay
        } else {
            
            imgvwSelection.image = UIImage()
        }
        
        imgvwSelection.contentMode = UIView.ContentMode.scaleAspectFit
        imgvwSelection.tintColor = isActive ? activeTintColor : unactiveTintColor
        addSubview(imgvwSelection)
        
        lblTitle = UILabel(frame: CGRect(x: imgvwSelection.frame.width + 8,
                                         y: 0,
                                         width: viewWidth - (imgvwSelection.frame.width + 8),
                                         height: self.frame.height))
        lblTitle.font = isActive ? activeFont : unactiveFont
        lblTitle.textColor = isActive ? activeTextColor : unactiveTextColor
        lblTitle.text = displayText
        lblTitle.numberOfLines = 0
        lblTitle.adjustsFontSizeToFitWidth = true
        addSubview(lblTitle)
        
        let tgrSelection: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                                          action: #selector(tapButton))
        self.addGestureRecognizer(tgrSelection)
    }
    
    @objc func tapButton() {
        
        isActive = !isActive
    }
}
