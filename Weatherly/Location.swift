//
//  Location.swift
//  Weatherly
//
//  Created by Ryan Maugin on 20/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstace = Location()
    private init() {}
    
    var latitude: Double!
    var longtitude: Double!
}
