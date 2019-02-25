//
//  Word.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation

struct Word {
    let surface: String
    let reading: String
    let pos: String
    
    init(surface: String, reading: String, pos: String) {
        self.surface = surface
        self.reading = reading
        self.pos = pos
    }
}
