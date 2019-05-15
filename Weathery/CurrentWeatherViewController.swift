//
//  CurrentWeatherViewController.swift
//  Weathery
//
//  Created by GUIEEN on 5/15/19.
//  Copyright © 2019 GUIEEN. All rights reserved.
//

import UIKit

class CurrentWeatherViewController: UIViewController {
    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var temperatureScaleLabel: UILabel!
    
    // Testing
    let forecastAPIKey = "0cb835f43a37eedf7f8eefc715413246"
    let coordinate: (lat: Double, long: Double) = (37.8267, -122.4233) // Tuple
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let forecastService = ForecastService(APIKEY: forecastAPIKey)
        forecastService.getForecast(latitude: coordinate.lat, longitude: coordinate.long) { (currentWeather) in
            // OFF THE MAIN QUEUE !
            if let currentWeather = currentWeather {
                // RULE: ALL UI CODE MUST HAPPEN ON THE MAIN QUEUE
                // TODO: get back to the main queue
                print("currentWeather :: \(currentWeather.temperature)")
                DispatchQueue.main.async {
                    if let temp = currentWeather.temperature {
                        self.temperatureLabel.text = "\(temp)"
                    } else {
                        self.temperatureLabel.text = "-"
                    }
                }
            }
        }
        // Do any additional setup after loading the view.
    }

}
