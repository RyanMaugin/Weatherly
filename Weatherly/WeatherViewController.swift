//
//  WeatherViewController.swift
//  Weatherly
//
//  Created by Ryan Maugin on 12/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    
    //// Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //// Weather Variables
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()
    
    //// Location Variables
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation! = nil
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // Try get most accurate location
        locationManager.requestWhenInUseAuthorization()             // Uses location manger only when app is in use
        locationManager.startMonitoringSignificantLocationChanges() // Keeps track of significant GPS changes
        
        // Set tableView delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Update the main UI to display temperature and more details
        currentWeather = CurrentWeather()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Before the view runs call locationAuthStatus function to set coordinate of user
        
        locationAuthStatus()
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
        currentTempLabel.text = "\(Int(currentWeather.currentTemp))°C"
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
                    }
                    self.forecasts.remove(at: 0) // Remove the first forecast because we already display current day weather
                    self.tableView.reloadData() // Reload data in tableview
                }
            }
            completed()
        }
    }
    
    
    func locationAuthStatus() {
        // This will run if the location manager was authorised by user to be used
        
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            
            // Get users location coordinates
            currentLocation = locationManager.location
            Location.sharedInstace.latitude = currentLocation.coordinate.latitude
            Location.sharedInstace.longtitude = currentLocation.coordinate.longitude
            
            // Once coordinate are downloaded then update ui
            currentWeather.downloadWeatherDetails {
                self.downloadForecastData {
                    self.updateMainUI()
                }
            }
            
            print(FORECAST_URL)
            
        } else {
            // This will request use of location to user if it's their first time use
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    
}


























