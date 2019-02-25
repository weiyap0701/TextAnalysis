//
//  Helper+UIView.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 24/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    //MARK: Anchor
    func anchorViewTo(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        anchorViewWithConstantsTo(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorViewWithConstantsTo(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let tempTop = top {
            topAnchor.constraint(equalTo: tempTop, constant: topConstant).isActive = true
        }
        if let tempLeft = left {
            leftAnchor.constraint(equalTo: tempLeft, constant: leftConstant).isActive = true
        }
        if let tempBottom = bottom {
            bottomAnchor.constraint(equalTo: tempBottom, constant: -bottomConstant).isActive = true
        }
        if let tempRight = right {
            rightAnchor.constraint(equalTo: tempRight, constant: -rightConstant).isActive = true
        }
    }
    
    func anchorViewWithHeightConstant(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func anchorViewWithWidthConstant(width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func anchorViewWithHeightAndWidthConstant(height: CGFloat, width: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func centerViewWithX(x: NSLayoutXAxisAnchor) {
        centerXAnchor.constraint(equalTo: x).isActive = true
    }
    
    func centerViewWithY(y: NSLayoutYAxisAnchor) {
        centerYAnchor.constraint(equalTo: y).isActive = true
    }
    
    func centerViewWithXandY(x: NSLayoutXAxisAnchor, y: NSLayoutYAxisAnchor) {
        centerXAnchor.constraint(equalTo: x).isActive = true
        centerYAnchor.constraint(equalTo: y).isActive = true
    }
}
