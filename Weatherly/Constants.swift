//
//  Constants.swift
//  Weatherly
//
//  Created by Ryan Maugin on 14/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//


import Foundation

typealias DownloadComplete = () -> ()

//// Current Weather API Constants

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGTITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "78b2bd900261fe1781439f02ce874660"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)51\(LONGTITUDE)0\(APP_ID)\(API_KEY)"


//// Forecast Weather API Constants

let BASE_FORECAST_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?"
let F_LATITUDE = "lat="
let F_LONGTITUDE = "&lon="
let F_DAY_COUNT = "&cnt="
let F_MODE = "&mode=json"
let F_APP_KEY = "&appid="

let FORECAST_URL = "\(BASE_FORECAST_URL)\(F_LATITUDE)51\(F_LONGTITUDE)0\(F_DAY_COUNT)10\(F_MODE)\(F_APP_KEY)\(API_KEY)"
