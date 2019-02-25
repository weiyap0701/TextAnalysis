//
//  Helper+UIColor.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 24/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    //MARK: Theme Color
    static func darkPurple() -> UIColor {
        return UIColor.rgb(red: 55, green: 0, blue: 179)
    }
    
    static func primaryPurple() -> UIColor {
        return UIColor.rgb(red: 98, green: 0, blue: 238)
    }
    
    static func secondaryPurple() -> UIColor {
        return UIColor.rgb(red: 167, green: 119, blue: 250)
    }
    
    static func secondaryTeal() -> UIColor {
        return UIColor.rgb(red: 3, green: 218, blue: 197)
    }
}
