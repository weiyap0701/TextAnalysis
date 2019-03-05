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
    private(set) var dataUpdatedEvent = Event()
    private(set) var errorMessage: String = "Please try again later."
    private(set) var words: [OutputCellViewModel]?
    private(set) var outputText: String?
    private(set) var displayError: Bool = false
    var inputText: String = ""
    
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
    
    func getOutputText() -> String? {
        guard let words = words, words.count > 0 else {
            return nil
        }
        let rubyTextArray = words.map({ $0.reading })
        let rubyText = rubyTextArray.joined()
        return rubyText
    }
    
    func getInputTextHeight() -> CGFloat {
        return getEstimatedStringHeight(text: inputText, textSize: 14)
    }
    
    func getOutputTextHeight() -> CGFloat {
        guard let text = getOutputText() else { return 0 }
        return getEstimatedStringHeight(text: text, textSize: 16)
    }
    
    private func getEstimatedStringHeight(text: String, textSize: CGFloat) -> CGFloat {
        let size = CGSize(width: UIScreen.main.bounds.width - 24, height: 1000)
        let estimatedHeight = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: textSize)], context: nil).height
        return estimatedHeight + 24
    }
}
