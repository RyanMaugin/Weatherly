//
//  DayForecast.swift
//  Weatherly
//
//  Created by Ryan Maugin on 27/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit

class DayForecast {
    
    //// Variables
    var dayIndex: Int!
    var _main: String!
    var _mainDescription: String!
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
    var main: String {
        if _main == nil {
            _main = "No Main"
        }
        return _main
    }
    
    var mainDescription: String {
        if _mainDescription == nil {
            _mainDescription = "No Description"
        }
        return _mainDescription
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
    
    
    //// Initiaising class
    init(dayIndex index: Int) {
        dayIndex = index
    }
}
