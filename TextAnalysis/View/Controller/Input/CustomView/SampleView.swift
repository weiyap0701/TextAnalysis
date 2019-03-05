//
//  SampleView.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 24/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class SampleView: BaseInputView {

    //MARK: UI
    private var inputLabel: UILabel!
    private var outputLabel: UILabel!
    
    //MARK: Function
    override func createView() {
        setTitle(text: "サンプル")
        createSampleLabel()
    }
    
    private func createSampleLabel() {
        //input label
        inputLabel = createLabel(text: "入力：今日はいい天気です", font: .systemFont(ofSize: 15), textColor: .darkGray)
        addSubview(inputLabel)
        inputLabel.anchorViewWithConstantsTo(top: titleView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        inputLabel.anchorViewWithHeightConstant(height: 20)
        
        //output label
        outputLabel = createLabel(text: "出力：きょうはいいてんきです", font: .systemFont(ofSize: 15), textColor: .darkGray)
        addSubview(outputLabel)
        outputLabel.anchorViewWithConstantsTo(top: inputLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 12, leftConstant: 8, bottomConstant: 0, rightConstant: 8)
        outputLabel.anchorViewWithHeightConstant(height: 20)
    }
    
    private func createLabel(text: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        return label
    }
}
