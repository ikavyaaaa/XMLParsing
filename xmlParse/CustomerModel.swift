////
////  CustomerModel.swift
////  xmlParse
////
////  Created by Kavya on 18/09/22.
////
//
//import Foundation
//import SWXMLHash
//
//// MARK: - Welcome
//struct Model1: Codable {
//    let feed: Feeds
//}
//
//// MARK: - Feed
//struct Feeds: Codable {
//    let id: String
//    let title: String
//    let updated: Date
//    let link: [String]
//    let entry: [Entry]
//}
//
//// MARK: - Entry
//struct Entry: Codable {
//    let id: String
//    let category: String
//    let link: [String]
//    let title: String
//    let updated: Date
//    let author: Author
//    let content: Content
//}
//
//// MARK: - Author
//struct Author: Codable {
//    let name: String
//}
//
//// MARK: - Content
//struct Content: Codable {
//    let properties: Properties
//}
//
//// MARK: - Properties
//struct Properties: Codable {
//    let customerID, companyName, contactName, contactTitle: String
//    let address, city: String
//    let region: Region
//    let postalCode: PostalCode
//    let country, phone, fax: String
//
//    enum CodingKeys: String, CodingKey {
//        case customerID
//        case companyName
//        case contactName
//        case contactTitle
//        case address
//        case city
//        case region
//        case postalCode
//        case country
//        case phone
//        case fax
//    }
//}
//
//enum PostalCode: Codable {
//    case integer(Int)
//    case string(String)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let x = try? container.decode(Int.self) {
//            self = .integer(x)
//            return
//        }
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        throw DecodingError.typeMismatch(PostalCode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for PostalCode"))
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .integer(let x):
//            try container.encode(x)
//        case .string(let x):
//            try container.encode(x)
//        }
//    }
//}
//
//enum Region: String, Codable {
//    case bc = "BC"
//    case empty = ""
//    case sp = "SP"
//}
