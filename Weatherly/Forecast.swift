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
    
}
