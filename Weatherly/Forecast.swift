//
//  Forecast.swift
//  Weatherly
//
//  Created by Ryan Maugin on 15/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit
import Alamofire

class Forecast {
    
    //// Variables
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    //// Data encapsulation
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>) {
        
        // Get the weather min and max temperature and convert to celsius
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            
            /// Gets minimum temperature
            if let min = temp["min"] as? Double {
                let kelvinToCelsius = min - 273.5
                self._lowTemp = "\(kelvinToCelsius)"
            }
            
            /// Get maximum temperature
            if let max = temp["max"] as? Double {
                let kelvinToCelsius = max - 273.5
                self._highTemp = "\(kelvinToCelsius)"
            }
            
        }
        
        // Get weather type
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        // Get the date
        if let date = weatherDict["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
}


// Craete an ectension for the date to display the day of the week
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}






