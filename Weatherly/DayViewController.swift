//
//  DayViewController.swift
//  Weatherly
//
//  Created by Ryan Maugin on 26/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {
    
    //// Passed data from WeatherViewController
    private var _passedDayIndex: String!
    var passedDayIndex: String {
        get { return _passedDayIndex } set { _passedDayIndex = newValue }
    }
    
    //// Variables
    var dayForecast: DayForecast!


    override func viewDidLoad() {
        super.viewDidLoad()
        // This will run when the view is loaded and will 
        dayForecast = DayForecast(dayIndex: Int(_passedDayIndex)!)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // This will run before view did load and initilise the view
        dayForecast.downloadDayWeatherDetail {}
    }

}
