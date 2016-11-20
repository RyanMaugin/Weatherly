//
//  Constants.swift
//  Weatherly
//
//  Created by Ryan Maugin on 14/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//


import Foundation

typealias DownloadComplete = () -> ()

//// Current Weather API Constant
let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstace.latitude!)&lon=\(Location.sharedInstace.longtitude!)&appid=78b2bd900261fe1781439f02ce874660"


//// Forecast Weather API Constant
let FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstace.latitude!)&lon=\(Location.sharedInstace.longtitude!)&cnt=10&mode=json&appid=78b2bd900261fe1781439f02ce874660"
