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
    
}
