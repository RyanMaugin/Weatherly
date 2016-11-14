//
//  Constants.swift
//  Weatherly
//
//  Created by Ryan Maugin on 14/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//


import Foundation


//// Current Weather API Constants

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGTITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "78b2bd900261fe1781439f02ce874660"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)5\(LONGTITUDE)5\(APP_ID)\(API_KEY)"
