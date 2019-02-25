//
//  OutputViewModel.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

class TextAnalysisViewModel: NSObject {
    
    //MARK: Property
    var dataUpdatedEvent = Event()
    
    var errorMessage: String = "Please try again later."
    var inputText: String = ""
    var words: [OutputCellViewModel]?
    var outputText: String?
    var displayError: Bool = false
    
    //MARK: Function
    func analyseText() {
        APIService.shared.analyseText(withText: inputText) { (words, error) in
            if let err = error {
                self.errorMessage = err.localizedDescription
                self.displayError = true
            }
            if let tempWords = words {
                self.words = tempWords.map({ OutputCellViewModel(word: $0) })
                self.displayError = false
            }
            else {
                self.displayError = true
            }
            self.dataUpdatedEvent.trigger()
        }
    }
    
    func getInputTextHeight() -> CGFloat {
        return getEstimatedStringHeight(text: inputText, textSize: 14)
    }
    
    func getOutputTextHeight() -> CGFloat {
        guard let words = words, words.count > 0 else {
            return 0
        }
        let rubyTextArray = words.map({ $0.reading })
        let rubyText = rubyTextArray.joined()
        outputText = rubyText
        return getEstimatedStringHeight(text: rubyText, textSize: 16)
    }
    
    private func getEstimatedStringHeight(text: String, textSize: CGFloat) -> CGFloat {
        let size = CGSize(width: UIScreen.main.bounds.width - 24, height: 1000)
        let estimatedHeight = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: textSize)], context: nil).height
        return estimatedHeight + 24
    }
}
