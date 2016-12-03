//
//  DayViewController.swift
//  Weatherly
//
//  Created by Ryan Maugin on 26/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit
import ScrollableGraphView

class DayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /// Variables & IBOutlets
    var dayForecast: DayForecast!
    @IBOutlet weak var tableView: UITableView!
    
    /// Passed data from WeatherViewController
    private var _passedDayIndex: Int!
    var passedDayIndex: Int {
        get { return _passedDayIndex } set { _passedDayIndex = newValue }
    }
    
    /// Graph View Variables
    @IBOutlet weak var graphView: ScrollableGraphView?
    var graphLabels: [String] = ["MORNING", "EVENING", "NIGHT"]
    var graphData: [Double] = [10.0, 8.0, 24.0]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This will run when the view is loaded and will 
        dayForecast = DayForecast(dayIndex: _passedDayIndex)
        
        // Add tableView delegate and datasource
        tableView.dataSource = self
        tableView.delegate =   self
        
        // Graph view test
        graphView?.lineStyle = ScrollableGraphViewLineStyle.smooth
        graphView?.set(data: graphData, withLabels: graphLabels)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // This will run before view did load and initilise the view
        dayForecast.downloadDayWeatherDetail {}
    }
    
    
    /// MARK:- TableView Protocols
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // This just tell the table view that one clums is needed
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // This function simply displays a specific amount of rows
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This will set up the cells which are viewable with the correct info and unload them when the can't be seen
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayCell", for: indexPath)
        return cell
    }

}






