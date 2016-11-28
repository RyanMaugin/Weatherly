//
//  DayForecast.swift
//  Weatherly
//
//  Created by Ryan Maugin on 27/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit
import Alamofire

class DayForecast {
    
    //// Variables
    var _dayIndex: Int!
    var _weather: String!
    var _weatherDescription: String!
    var _date: String!
    var _minTemp: String!
    var _maxTemp: String!
    var _morningTemp: Int!
    var _eveTemp: Int!
    var _nightTemp: Int!
    var _pressure: String!
    var _humidity: String!
    var _clouds: String!
    
    
    //// Initialisers
    var dayIndex: Int {
        if _dayIndex == nil {
            _dayIndex = 1
        }
        return _dayIndex
    }
    
    var weather: String {
        if _weather == nil {
            _weather = "No Main"
        }
        return _weather
    }
    
    var weatherDescription: String {
        if _weatherDescription == nil {
            _weatherDescription = "No Description"
        }
        return _weatherDescription
    }
    
    var date: String {
        if _date == nil {
            _date = "Date Unavailable"
        }
        return _date
    }
    
    var minTemp: String {
        if _minTemp == nil {
            _minTemp = "0"
        }
        return _minTemp
    }
    
    var maxTemp: String {
        if _maxTemp == nil {
            _maxTemp = "0"
        }
        return _maxTemp
    }
    
    var morningTemp: Int {
        if _morningTemp == nil {
            _morningTemp = 1
        }
        return _morningTemp
    }
    
    var eveTemp: Int {
        if _eveTemp == nil {
            _eveTemp = 1
        }
        return _eveTemp
    }
    
    var nightTemp: Int {
        if _nightTemp == nil {
            _nightTemp = 1
        }
        return _nightTemp
    }
    
    var pressure: String {
        if _pressure == nil {
            _pressure = "Unavailable"
        }
        return _pressure
    }
    
    var humidity: String {
        if _humidity == nil {
            _humidity = "Unavailable"
        }
        return _humidity
    }
    
    var clouds: String {
        if _clouds == nil {
            _clouds = "Unavailable"
        }
        return _clouds
    }
    
    
    // Download the current day data
    func downloadDayWeatherDetail(completed: @escaping DownloadComplete) {
        
        /// Alamofire request download URL
        let dayUrl = URL(string: FORECAST_URL)!
        
        /// Make alamofire request for the needed data
        Alamofire.request(dayUrl).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                /// List of day weather details
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    if let listIndex = list[self._dayIndex] as? Dictionary<String, AnyObject> {
                        
                        /// Get Date
                        if let Date = listIndex["dt"] as? Int {
                            self._date = "\(Date)"
                            print(Date)
                        }
                        
                        /// Get Pressure
                        if let Pressure = listIndex["pressure"] as? Int {
                            self._pressure = "\(Pressure)"
                            print(Pressure)
                        }
                        
                        /// Get Humidity
                        if let Humidity = listIndex["humidity"] as? Int {
                            self._humidity = "\(Humidity)"
                            print(Humidity)
                        }
                        
                        /// Get Clouds
                        if let Clouds = listIndex["clouds"] as? Int {
                            self._clouds = "\(Clouds)"
                            print(Clouds)
                        }
                        
                        /// Temperature dictionary
                        if let temp = listIndex["temp"] as? Dictionary<String, AnyObject> {
                            
                            /// Max Temperature
                            if let max = temp["max"] as? Int {
                                self._maxTemp = "\(max)"
                                print(max)
                            }
                            
                            /// Min Temperature
                            if let min = temp["min"] as? Int {
                                self._minTemp = "\(min)"
                                print(min)
                            }
                            
                            /// Morning Temperature
                            if let morn = temp["morn"] as? Int {
                                self._morningTemp = morn
                                print(morn)
                            }
                            
                            /// Evening Temperature
                            if let eve = temp["eve"] as? Int {
                                self._eveTemp = eve
                                print(eve)
                            }
                            
                            /// Night Temperature
                            if let night = temp["night"] as? Int {
                                self._nightTemp = night
                                print(night)
                            }
                            
                        }
                        
                        /// Main Dictionary
                        if let weatherArr = listIndex["weather"] as? [Dictionary<String, AnyObject>] {
                            
                            /// Weather dictionary
                            if let weatherDict = weatherArr[0] as? Dictionary<String, AnyObject> {
                                
                                /// Weather
                                if let Weather = weatherDict["main"] as? String {
                                    self._weather = Weather
                                    print(Weather)
                                }
                                
                                /// Weather Description
                                if let WeatherDescription = weatherDict["description"] as? String {
                                    self._weatherDescription = WeatherDescription
                                    print(WeatherDescription)
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            
            completed() /// Request is complete and can stop
        }
        
    }
    
    
    //// Initiaising class
    init(dayIndex index: Int) {
        _dayIndex = index
    }
}
