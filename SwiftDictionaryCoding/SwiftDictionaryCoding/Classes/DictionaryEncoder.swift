//
//  DictionaryEncoder.swift
//  Dreadsheet
//
//  Created by Ashley Mills on 13/09/2018.
//  Copyright © 2018 Joylord Systems Ltd. All rights reserved.
//

import Foundation

public class DictionaryEncoder {
    
    public init() {
    }
    
    private let encoder = JSONEncoder()
    
    public var dateEncodingStrategy: JSONEncoder.DateEncodingStrategy {
        set { encoder.dateEncodingStrategy = newValue }
        get { return encoder.dateEncodingStrategy }
    }
    
    public var dataEncodingStrategy: JSONEncoder.DataEncodingStrategy {
        set { encoder.dataEncodingStrategy = newValue }
        get { return encoder.dataEncodingStrategy }
    }
    
    public var nonConformingFloatEncodingStrategy: JSONEncoder.NonConformingFloatEncodingStrategy {
        set { encoder.nonConformingFloatEncodingStrategy = newValue }
        get { return encoder.nonConformingFloatEncodingStrategy }
    }
    
    public var keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy {
        set { encoder.keyEncodingStrategy = newValue }
        get { return encoder.keyEncodingStrategy }
    }

    public func encode<T>(_ value: T) throws -> [String: Any] where T : Encodable {
        let data = try encoder.encode(value)
        return try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
    }
}

