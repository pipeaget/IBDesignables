//
//  FORProgressView.swift
//  FADBanorte
//
//  Created by Felipe Ortega on 7/19/18.
//  Copyright © 2018 Banorte. All rights reserved.
//

import UIKit

@IBDesignable class FORProgressView: UIView {
    
    //MARK: - INSPECTABLE VARIABLES
    
    @IBInspectable var isStepRounded: Bool = true {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var leadingTrailing: CGFloat = 50 {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var currentIndex: Int = 1 {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var numberOfSteps: Int = 3 {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var stepTitles: String = "Marco, Polo" {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var activeStepFont: UIFont = UIFont.systemFont(ofSize: 11,
                                                                  weight: UIFont.Weight.regular) {
        didSet{
            updateview()
        }
    }
    
    @IBInspectable var activeTextColor: UIColor = UIColor.black {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var activeStepColor: UIColor = UIColor.black {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var activeConnectorColor: UIColor = UIColor.black {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var unactiveStepFont: UIFont = UIFont.systemFont(ofSize: 11,
                                                                    weight: UIFont.Weight.light) {
        didSet{
            updateview()
        }
    }
    
    @IBInspectable var unactiveTextColor: UIColor = UIColor.lightGray {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var unactiveStepColor: UIColor = UIColor.lightGray {
        didSet {
            updateview()
        }
    }
    
    @IBInspectable var unactiveConnectorColor: UIColor = UIColor.lightGray {
        didSet {
            updateview()
        }
    }
    
    //MARK: - VARIABLES
    
    
    //MARK: - VIEW LIFECYCLE
    
    override func draw(_ rect: CGRect) {
        
        validateFrame()
        updateview()
    }
    
    //MARK: - FUNCTIONS
    
    func validateLeadingTrailing() {
        
        if leadingTrailing < CGFloat(numberOfSteps * 70) {
            
            leadingTrailing = CGFloat(numberOfSteps * 70)
        }
    }
    
    func validateFrame() {
        
        if frame.height < 31 {
            
            self.frame = CGRect(x: self.frame.origin.x,
                                y: self.frame.origin.y,
                                width: self.frame.width,
                                height: 31)
        }
    }
    
    func validateNumberOfSteps() {
        
        if numberOfSteps < 2 {
            
            numberOfSteps = 2
        }else if numberOfSteps > 5 {
            
            numberOfSteps = 5
        }
    }
    
    func validateStepTitles() {
        
        if numberOfSteps > stepTitles.components(separatedBy: ",").count {
            
            stepTitles = "Error,Error,Error,Error,Error"
        }
    }
    
    func validateCurrentIndex() {
        
        if currentIndex > numberOfSteps {
            
            currentIndex = numberOfSteps
        }
    }
    
    var arrLabels: [UILabel] = []
    var arrSteps: [UIView] = []
    var arrConnectors: [UIView] = []
    var arrTitles: [String] = []
    
    func updateview() {
        
        self.subviews.forEach{$0.removeFromSuperview()}
        arrLabels = []
        arrSteps = []
        arrConnectors = []
        arrTitles = []
        
        validateCurrentIndex()
        validateStepTitles()
        validateNumberOfSteps()
        
        arrTitles = stepTitles.components(separatedBy: ",")
        
        let viewWidth: CGFloat = self.frame.width
        let stepLabelHeight: CGFloat = frame.height * 0.5
        let stepLabelWidth: CGFloat = viewWidth / CGFloat(numberOfSteps)
        let stepViewHeight: CGFloat = (frame.height * 0.5)
        let stepViewWidth: CGFloat = (frame.height * 0.5)
        let stepConnectorHeight: CGFloat = floor(stepViewHeight * 0.14)
        let stepConnectorWidth: CGFloat = stepLabelWidth
        
        for i in 0...numberOfSteps - 1{
            
            let lblStep: UILabel = UILabel(frame: CGRect(x: (CGFloat(i) * stepLabelWidth),
                                                         y: 0,
                                                         width: stepLabelWidth,
                                                         height: stepLabelHeight))
            lblStep.font = currentIndex == i ? activeStepFont : unactiveStepFont
            lblStep.textColor = currentIndex == i ? activeTextColor : unactiveTextColor
            lblStep.text = arrTitles[i]
            lblStep.textAlignment = NSTextAlignment.center
            lblStep.tag = i + 1
            arrLabels.append(lblStep)
            addSubview(lblStep)
            
            if i != 0 {
                
                let vwConnector: UIView = UIView(frame: CGRect(x: ((viewWidth / CGFloat(numberOfSteps)) * CGFloat(i)) - ((viewWidth / CGFloat(numberOfSteps)) / 2),
                                                               y: stepLabelHeight + (stepViewHeight / 2) - 1,
                                                               width: stepConnectorWidth,
                                                               height: stepConnectorHeight))
                vwConnector.backgroundColor = currentIndex < i ? unactiveConnectorColor : activeConnectorColor
                vwConnector.layer.zPosition = -1
                addSubview(vwConnector)
            }
            
            let vwStep: UIView = UIView(frame: CGRect(x: (viewWidth / CGFloat(numberOfSteps)) * CGFloat(i) + ((viewWidth / CGFloat(numberOfSteps)) / 2) - 3,
                                                      y: stepLabelHeight + 3,
                                                      width: stepViewWidth - 6,
                                                      height: stepViewHeight - 6))
            vwStep.backgroundColor = currentIndex >= i ? activeStepColor : unactiveStepColor
            vwStep.tag = i + 1
            vwStep.layer.cornerRadius = isStepRounded ? (stepViewHeight / 2) : 0
            arrSteps.append(vwStep)
            addSubview(vwStep)
            
            if i == currentIndex {
                
                let vwCurrentStep: UIView = UIView(frame: CGRect(x: (viewWidth / CGFloat(numberOfSteps)) * CGFloat(i) + ((viewWidth / CGFloat(numberOfSteps)) / 2) - 6,
                                                                 y: stepLabelHeight,
                                                                 width: stepViewWidth,
                                                                 height: stepViewHeight))
                vwCurrentStep.backgroundColor = UIColor.clear
                vwCurrentStep.layer.borderWidth = 1
                vwCurrentStep.layer.borderColor = activeStepColor.cgColor
                vwCurrentStep.layer.cornerRadius = isStepRounded ? (stepViewHeight / 2) : 0
                addSubview(vwCurrentStep)
            }
        }
    }
}
