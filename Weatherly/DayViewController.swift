//
//  DayViewController.swift
//  Weatherly
//
//  Created by Ryan Maugin on 26/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit
import ScrollableGraphView

class DayViewController: UIViewController {
    
    /// Variables
    var dayForecast: DayForecast!
    
    /// Passed data from WeatherViewController
    private var _passedDayIndex: Int!
    var passedDayIndex: Int {
        get { return _passedDayIndex } set { _passedDayIndex = newValue }
    }
    
    /// Graph View Variables
    @IBOutlet weak var graphView: ScrollableGraphView?
    var graphLabels: [String] = ["ONE", "TWO", "THREE", "FOUR"]
    var graphData: [Double] = [10.0, 8.0, 24.0, 36.0]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // This will run when the view is loaded and will 
        dayForecast = DayForecast(dayIndex: _passedDayIndex)
        
        // Graph view test
        graphView?.lineStyle = ScrollableGraphViewLineStyle.smooth
        graphView?.set(data: graphData, withLabels: graphLabels)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // This will run before view did load and initilise the view
        dayForecast.downloadDayWeatherDetail {}
    }

}
