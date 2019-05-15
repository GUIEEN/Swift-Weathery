//
//  CurrentWeather.swift
//  Weathery
//
//  Created by GUIEEN on 5/14/19.
//  Copyright © 2019 GUIEEN. All rights reserved.
//

import Foundation

class CurrentWeather
{
    var temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    
    struct WeatherKey {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
    }
    
    /*
     https://stackoverflow.com/questions/49610727/unable-to-bridge-nsnumber-to-float-in-json-parsing
     JSONSerialization documentation says:
     
     A Foundation object that may be converted to JSON must have the following properties:
     
     The top level object is an NSArray or NSDictionary.
     All objects are instances of NSString, NSNumber, NSArray, NSDictionary, or NSNull.
     All dictionary keys are instances of NSString.
     Numbers are not NaN or infinity.
     */
    init(weatherDictionary: [String: Any]) {
        temperature = weatherDictionary[WeatherKey.temperature] as? Int
        print(weatherDictionary["temperature"]!)
        print(weatherDictionary[WeatherKey.temperature]!)
        print(weatherDictionary[WeatherKey.temperature] as? Int) // nil
        print()
        if let tempVal = weatherDictionary[WeatherKey.temperature] as? NSNumber {
            temperature = tempVal.intValue
        }
        print(weatherDictionary)
        if let humidityDouble = weatherDictionary[WeatherKey.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKey.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKey.summary] as? String
        
    }
}















