//
//  APIService.swift
//  TextAnalysis
//
//  Created by Ong Wei Yap on 25/2/19.
//  Copyright © 2019 Ong Wei Yap. All rights reserved.
//

import Foundation
import Alamofire

class APIService: NSObject, XMLParserDelegate {
    
    //MARK: Property
    private var analyseTextCompletion: (([Word]?, Error?) -> Void)?
    
    private var currentElement: String = ""
    
    private var words = [Word]()
    private var currentSurface: String = ""
    private var currentReading: String = ""
    private var currentPos: String = ""

    //MARK: Function
    func analyseText(withText text: String, completion: @escaping([Word]?, Error?) -> Void) {
        analyseTextCompletion = completion
        Alamofire.request(TextRouter.analyse(text)).responseData { data in
            
            guard data.result.isSuccess else {
                completion(nil, data.error)
                return
            }
            
            guard let xmlData = data.result.value else {
                completion(nil, nil)
                return
            }
            
            let xmlParser = XMLParser.init(data: xmlData)
            xmlParser.delegate = self
            xmlParser.parse()
        }
    }
    
    //MARK: XMLParser Delegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if elementName == "word" {
            currentSurface = ""
            currentReading = ""
            currentPos = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "surface":
            currentSurface = string
        case "reading":
            currentReading = string
        case "pos":
            currentPos = string
        default:
            break
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "word" {
            let word = Word(surface: currentSurface, reading: currentReading, pos: currentPos)
            words.append(word)
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        analyseTextCompletion?(words, nil)
        words.removeAll()
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        analyseTextCompletion?(nil, parseError)
        words.removeAll()
    }
}
