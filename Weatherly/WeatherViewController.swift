//
//  WeatherViewController.swift
//  Weatherly
//
//  Created by Ryan Maugin on 12/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //// Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //// Variables
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set tableView delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Update the main UI to display temperature and more details
        currentWeather = CurrentWeather()
        //forecast = Forecast()
        currentWeather.downloadWeatherDetails {
            self.downloadForecastData {
                self.updateMainUI()
            }
        }
    }
    
    
    //// MARK:- Table View Protocols

    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of colums to be displayed in tableView
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // This will return the amount of rows to be dis[;ayed in tableVoew
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This creates the cell and then returns it
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherCell {
            /// This will return the correct forecast info in the cell
            
            let forecast = forecasts[indexPath.row]
            cell.configureCell(forecast: forecast)
            return cell
            
        } else {
            
            return WeatherCell()
        }

    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // This will create buttons for when the cell is swiped and reveals them to be pressed
        
        let info = UITableViewRowAction(style: .normal, title: "  Info  ", handler: { action, index in
            print("Info was pressed!")
        })
        info.backgroundColor = UIColor.red
        
        return [info]
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // This needs to be called in order to commit styles and allow swipeable cells
    }
    
    
    //// MARK:- Custom functions
    
    func updateMainUI() {
        // This will update the Main date UI to display the weather that has been retrieved through http request
        
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(Int(currentWeather.currentTemp))°"
        locationLabel.text = currentWeather.cityName
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }
    
    
    func downloadForecastData(completed: @escaping DownloadComplete) {
        // Downloading our forecast weather data for the TableView
        
        let forecastUrl = URL(string: FORECAST_URL)!
        
        // Make alamofire request
        Alamofire.request(forecastUrl).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.forecasts.remove(at: 0) // Remove the first forecast because we already display current day weather
                    self.tableView.reloadData() // Reload data in tableview
                }
            }
            completed()
        }
    }
    
    
}


























