//
//  DataModel.swift
//  xmlParse
//
//  Created by Kavya on 17/09/22.
//

import Foundation
import SWXMLHash
struct Model: XMLObjectDeserialization {
    let feed: Feed
    static func deserialize(_ node: XMLIndexer) throws -> Model {
        return try Model(
            feed: node["feed"].value()
           
        )
    }
}


struct Feed: XMLObjectDeserialization {
    let id: String
    let entry: [Entry]

    static func deserialize(_ node: XMLIndexer) throws -> Feed {
        return try Feed(
            id: node["id"].value(),
            entry : node["entry"].value()
        )
    }
}

struct Entry :XMLObjectDeserialization{
    let id: String
    let category: String
    let content: Content
    static func deserialize(_ node: XMLIndexer) throws -> Entry {
        return try Entry(
            id: node["id"].value(),
            category: node["category"].value(), content: node["content"].value()
        )
    }
}

struct Content :XMLObjectDeserialization {
    let properties : Properties
    static func deserialize(_ node: XMLIndexer) throws -> Content {
        return try Content(
            properties: node["properties"].value()
        )
    }
}

struct Properties :XMLObjectDeserialization {
    let ContactName:String
    static func deserialize(_ node: XMLIndexer) throws -> Properties {
        return try Properties(
            ContactName: node["ContactName"].value()
        )
    }
}
    
    
