//
//  InputTextView.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 24/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class InputTextView: BaseInputView, UITextViewDelegate {
    
    //MARK: UI
    private lazy var textView: UITextView = {
        let tv = UITextView()
        tv.textColor = .darkText
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.returnKeyType = UIReturnKeyType.done
        tv.delegate = self
        return tv
    }()
    
    private let eraseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "eraser"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(eraseText), for: .touchUpInside)
        return button
    }()
    
    //MARK: Function
    @objc private func eraseText() {
        textView.text = nil
    }
    
    override func createView() {
        setTitle(text: "入力")
        
        createEraseButton()
        createTextView()
    }
    
    private func createTextView() {
        addSubview(textView)
        textView.anchorViewWithConstantsTo(top: titleView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 6, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
        textView.anchorViewWithHeightConstant(height: 148)
    }
    
    private func createEraseButton() {
        titleView.addSubview(eraseButton)
        eraseButton.anchorViewWithConstantsTo(top: nil, left: nil, bottom: nil, right: titleView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 4)
        eraseButton.centerViewWithY(y: titleView.centerYAnchor)
        eraseButton.anchorViewWithHeightAndWidthConstant(height: 40, width: 40)
    }
    
    func getText() -> String {
        return textView.text
    }
    
    //MARK: TextView Delegate
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.last == "\n" {
            textView.text.removeLast()
            textView.resignFirstResponder()
        }
    }
}
