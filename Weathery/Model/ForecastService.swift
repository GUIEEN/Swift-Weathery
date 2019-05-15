//
//  ForcastService.swift
//  Weathery
//
//  Created by GUIEEN on 5/14/19.
//  Copyright © 2019 GUIEEN. All rights reserved.
//

import Foundation

class ForecastService
{
    let forecastAPIKey: String
    // https://api.darksky.net/forecast/API_SECRET_KEY/37.8267,-122.4233
    let forecastBaseURL: URL?
    
    init(APIKEY: String)
    {
        self.forecastAPIKey = APIKEY
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKEY)")
    }
    
    func getForecast(latitude: Double, longitude: Double, completion: @escaping (CurrentWeather?) -> Void)
    {
        if let forecastURL = URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)") {
            
            let networkProcessor = NetworkProcessor(url: forecastURL)
            networkProcessor.downloadJSONFromURL { (jsonDictionary) in
                
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: Any] {
                    
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    print("-----")
                    print(currentWeather)
                    completion(currentWeather)
                } else {
                    completion(nil)
                }
                
            }
            
        }
    }
}













