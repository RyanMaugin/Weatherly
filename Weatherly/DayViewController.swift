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
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIImageView!
    var cellIdentifier: [String] = ["CLOUDS", "PRESSURE", "HUMIDITY"]
    var cellValue: [String]!
    
    /// Passed data from WeatherViewController
    private var _passedDayIndex: Int!
    var passedDayIndex: Int {
        get { return _passedDayIndex } set { _passedDayIndex = newValue }
    }
    
    /// Graph View Variables
    @IBOutlet weak var graphView: ScrollableGraphView?
    var graphLabels: [String] = ["MORNING", "EVENING", "NIGHT"]
    var graphData: [Double] = [10.0, 8.0, 24.0]
    
    //// Day Class
    var dayForecast: DayForecast!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This will pass the correct index to download weather details from to daay forecast class
        dayForecast = DayForecast(dayIndex: _passedDayIndex)
        
        // Add tableView delegate and datasource
        tableView.dataSource = self
        tableView.delegate =   self
        
        // Add tap gesture to back button
        let backTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DayViewController.goBack))
        backButton.addGestureRecognizer(backTap)
        
        // Graph view test
        graphView?.lineStyle = ScrollableGraphViewLineStyle.smooth
        graphView?.set(data: graphData, withLabels: graphLabels)
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
        
        /// Set up cells
        let cell: DayCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! DayCell
        cell.keyLabel.text = cellIdentifier[indexPath.row]
        
        // Get correct data and add it to the label
        dayForecast.downloadDayWeatherDetail {
            self.cellValue = [self.dayForecast.clouds, self.dayForecast.pressure, self.dayForecast.humidity]
            cell.valueLabel.text = self.cellValue[indexPath.row]
        }
        
        return cell
        
    }
    
    
    /// MARK:- Custom functions
    
    func goBack() {
        dismiss(animated: true, completion: nil)
    }

}






