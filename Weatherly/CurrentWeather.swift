//
//  CurrentWeather.swift
//  Weatherly
//
//  Created by Ryan Maugin on 14/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    
    //// Variables
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    
    //// Data encapsulation & making sure variable is never nil
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        // This will set the date style and return it as date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    
    //// Class Functions
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        
        // Alamofire download
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        // Make the http request
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            // Getting the data and saving them into the variables
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let current = main["temp"] as? Double {
                        // Returns temperature in kelvin format so conversion to Celsius is needed
                        let kelvinToCelsius = current - 273.5
                        self._currentTemp = kelvinToCelsius
                        print(Int(self._currentTemp))
                    }
                }
            }
            
            // Tells request that it's done
            completed()
            
        }
    }
    
}







