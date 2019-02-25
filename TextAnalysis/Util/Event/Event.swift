//
//  Event.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation

class Event: NSObject {
    private var observers = [() -> Void]()
    
    func addObserver<T: AnyObject>(_ observer: T, using closure: @escaping (T) -> Void) {
        observers.append { [weak observer] in
            observer.map(closure)
        }
    }
    
    func trigger() {
        for observer in observers {
            observer()
        }
    }
}
