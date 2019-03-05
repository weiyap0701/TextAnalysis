//
//  OutputHeaderCell.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class OutputHeaderCell: UICollectionViewCell {
    
    //MARK: UI
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var inputTextViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var outputTextViewHeightConstraint: NSLayoutConstraint!
    
    //MARK: Property
    var viewModel: TextAnalysisViewModel? {
        didSet {
            guard let vm = viewModel else {
                inputTextViewHeightConstraint.constant = 0
                outputTextViewHeightConstraint.constant = 0
                return
            }
            inputTextView.text = vm.inputText
            outputTextView.text = vm.getOutputText()
            inputTextViewHeightConstraint.constant = vm.getInputTextHeight()
            outputTextViewHeightConstraint.constant = vm.getOutputTextHeight()
        }
    }
    
    //MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createView()
    }
    
    //MARK: Function
    private func createView() {
        layer.borderWidth = 1.2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
    }
    
}
