//
//  AppDelegate.swift
//  Weathery
//
//  Created by GUIEEN on 5/14/19.
//  Copyright © 2019 GUIEEN. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//
////        let url = URL(string: "https://api.darksky.net/forecast/0cb835f43a37eedf7f8eefc715413246/37.8267,-122.4233")!
////        let networkProcessor = NetworkProcessor(url: url)
////
////        networkProcessor.downloadJSONFromURL { (jsonDictionary) in
////            print(jsonDictionary)
////        }
//
//        let forecastService = ForecastService(APIKEY: "0cb835f43a37eedf7f8eefc715413246")
//        forecastService.getForecast(latitude: 37.8267, longitude: -122.4233) { (currentWeather) in
//
//            print(currentWeather)
//        }
        
        return true
    }

}

