//
//  OutputCellViewModel.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation

class OutputCellViewModel: NSObject {
    
    //MARK: Property
    private(set) var word: Word
    var surface: String {
        return word.surface
    }
    var reading: String {
        return word.reading
    }
    var pos: String {
        return word.pos
    }
    
    //MARK: Life Cycle
    init(word: Word) {
        self.word = word
    }
    
}
