# SwiftDictionaryCoding

[![CI Status](https://img.shields.io/travis/ashleymills/SwiftDictionaryCoding.svg?style=flat)](https://travis-ci.org/ashleymills/SwiftDictionaryCoding)
[![Version](https://img.shields.io/cocoapods/v/SwiftDictionaryCoding.svg?style=flat)](https://cocoapods.org/pods/SwiftDictionaryCoding)
[![License](https://img.shields.io/cocoapods/l/SwiftDictionaryCoding.svg?style=flat)](https://cocoapods.org/pods/SwiftDictionaryCoding)
[![Platform](https://img.shields.io/cocoapods/p/SwiftDictionaryCoding.svg?style=flat)](https://cocoapods.org/pods/SwiftDictionaryCoding)


This library allows you to use a encode/decode Swift objects that conform to `Codable` protocols to and from Dictionaries in the same way you'd use a `JSONEncoder/Decoder` to convert to JSON. They use the same encoding and decoding strategies as their JSON counterparts (because they wrap the JSON equivalents)

### Encoding
```Swift

struct Event: Codable {
    let id: Int
    let location: String?
    let price: Float?
}

let event = Event(id: 1, eventName: "Christmas", location: nil, price: 10)
let encoder = DictionaryEncoder()
let dict = try encoder.encode(event) 
```

### Decoding
```Swift
let dict: [String: Any] = ["id": 1, "eventName": "Christmas", "price": 10]        
let decoder = DictionaryDecoder()
let event = try decoder.decode(Event.self, from: dict))
```


## Installation

SwiftDictionaryCoding is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SwiftDictionaryCoding'
```

## Author

ashleymills, ashleymills@mac.com

## License

SwiftDictionaryCoding is available under the MIT license. See the LICENSE file for more info.
