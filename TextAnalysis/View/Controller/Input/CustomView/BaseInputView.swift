//
//  BaseInputView.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 24/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class BaseInputView: UIView {
    
    //MARK: UI
    let titleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryPurple()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    //MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBackground()
        createTitle()
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Function
    private func setBackground() {
        backgroundColor = .white
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    private func createTitle() {
        addSubview(titleView)
        titleView.anchorViewTo(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor)
        titleView.anchorViewWithHeightConstant(height: 40)
        
        titleView.addSubview(titleLabel)
        titleLabel.anchorViewWithConstantsTo(top: nil, left: titleView.leftAnchor, bottom: nil, right: titleView.rightAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        titleLabel.centerViewWithY(y: titleView.centerYAnchor)
    }
    
    func createView() { }
    
    func setTitle(text: String) {
        titleLabel.text = text
    }
}
