//
//  RssXMLParser.swift
//  CustomItunes
//
//  Created by 低调 on 10/19/19.
//  Copyright © 2019 Kaiyuan Zhao. All rights reserved.
//

import Foundation
import UIKit
//name image media type

struct RSSItem {
    var name: String
    var image: String
    var type: String
}

class FeedParser: NSObject, XMLParserDelegate{
    private var rssItems: [RSSItem] = []
    private var currentElement = ""
    private var currentName: String = "" {
        didSet {
            currentName = currentName.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        
    }
    private var currentImage: String = ""
    private var currentType: String = ""
    
    private var parserCompletionHandler: (([RSSItem]) -> Void)?
    
    
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }

    
    
    func parseXML(url: String, completionHandler: @escaping (([RSSItem]) -> Void)){
        self.parserCompletionHandler = completionHandler
        
        let request = URLRequest(url: URL(string: url)!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                if let error = error {
                    print(error)
                }
                return
            }
            
            let parser = XMLParser(data: data)
            parser.delegate = self
            parser.parse()
        }
        task.resume()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        currentElement = elementName
        if currentElement == "item" {
            currentName = ""
            currentType = ""
            currentImage = ""
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        switch currentElement {
        case "title": currentName += string
        case "category": currentType += string
        case "description" : currentImage += string
        default: break
        }
    }
    
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let subString = currentType.split{$0.isNewline}
            let rssItem = RSSItem(name: currentName, image: currentImage, type: String((subString[subString.count - 2])))
            self.rssItems.append(rssItem)
        }
        
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        parserCompletionHandler?(rssItems)
    }
    
    
}
