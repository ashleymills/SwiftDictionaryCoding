//
//  DicionaryEncoderTests.swift
//  SwiftDictionaryCoding_Tests
//
//  Created by Ashley Mills on 13/09/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import SwiftDictionaryCoding

class DicionaryEncoderTests: XCTestCase {
    
    struct Person: Codable {
        let name: String
    }
    
    struct Event: Codable {
        let id: Int
        let eventName: String
        let location: String?
        let price: Float?
        let attendees: [Person]
    }
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEncode() throws {
        
        let event = Event(id: 1, eventName: "Christmas", location: nil, price: 10, attendees: [Person(name: "fred")])
        
        let encoder = DictionaryEncoder()
        
        let dict = try encoder.encode(event)
        
        let result: [String: Any] = ["id": 1, "eventName": "Christmas", "price": 10, "attendees": [["name": "fred"]]]
        
        XCTAssertEqual(dict as NSDictionary, result as NSDictionary)
    }
    
    func testEncodeSnakeCase() throws {
        
        let encoder = DictionaryEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        
        let event = Event(id: 1, eventName: "Christmas", location: nil, price: 10, attendees: [Person(name: "fred")])
        
        let dict = try encoder.encode(event)
        
        let result: [String: Any] = ["id": 1, "event_name": "Christmas", "price": 10, "attendees": [["name": "fred"]]]
        
        XCTAssertEqual(dict as NSDictionary, result as NSDictionary)
    }
    
    func testEncodeNonConformingFloatThrow() throws {
        
        let event = Event(id: 1, eventName: "Christmas", location: nil, price: Float.nan, attendees: [Person(name: "fred")])
        
        let encoder = DictionaryEncoder()
        
        XCTAssertThrowsError(try encoder.encode(event))
    }
    
    func testEncodeNonConformingFloatString() throws {
        
        let event = Event(id: 1, eventName: "Christmas", location: nil, price: Float.nan, attendees: [Person(name: "fred")])
        
        let encoder = DictionaryEncoder()
        encoder.nonConformingFloatEncodingStrategy = .convertToString(positiveInfinity: "+INF", negativeInfinity: "-INF", nan: "ERROR")
        
        let dict = try encoder.encode(event)
        
        let result: [String: Any] = ["id": 1, "eventName": "Christmas", "price": "ERROR", "attendees": [["name": "fred"]]]
        
        XCTAssertEqual(dict as NSDictionary, result as NSDictionary)
    }
}
