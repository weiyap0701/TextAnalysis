//
//  ErrorView.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class ErrorView: UIView {
    
    //MARK: UI
    private let errorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "error")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkText
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    //MARK: Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Function
    private func createView() {
        backgroundColor = .white
        
        addSubview(errorImageView)
        errorImageView.anchorViewWithHeightAndWidthConstant(height: 120, width: 120)
        errorImageView.centerViewWithXandY(x: centerXAnchor, y: centerYAnchor)
        
        addSubview(errorLabel)
        errorLabel.anchorViewWithConstantsTo(top: errorImageView.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        errorLabel.anchorViewWithWidthConstant(width: 200)
        errorLabel.centerViewWithX(x: centerXAnchor)        
    }
    
    func setErrorText(text: String) {
        errorLabel.text = text
    }
}
