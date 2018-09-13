//
//  DicionaryDecoderTests.swift
//  SwiftDictionaryCoding_Tests
//
//  Created by Ashley Mills on 13/09/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import SwiftDictionaryCoding

class DicionaryDecoderTests: XCTestCase {
    
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
    
    func testDecode() throws {
        
        let dict: [String: Any] = ["id": 1, "eventName": "Christmas", "price": 10, "attendees": [["name": "fred"]]]
        
        let decoder = DictionaryDecoder()
        
        XCTAssertNoThrow(try decoder.decode(Event.self, from: dict))
    }
    
    func testDecodeSnakeCase() throws {
        
        let dict: [String: Any] = ["id": 1, "event_name": "Christmas", "price": 10, "attendees": [["name": "fred"]]]
        
        let decoder = DictionaryDecoder()
        
        XCTAssertThrowsError(try decoder.decode(Event.self, from: dict))
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        XCTAssertNoThrow(try decoder.decode(Event.self, from: dict))
    }

}
