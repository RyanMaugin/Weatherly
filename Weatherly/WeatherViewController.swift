//
//  WeatherViewController.swift
//  Weatherly
//
//  Created by Ryan Maugin on 12/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //// Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var CurrentWeatherTypeLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //// Variables
    let currentWeather = CurrentWeather()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set tableView delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather.downloadWeatherDetails {
            // TODO: Update UI to display data
        }
    }
    
    
    // MARK:- Table View Protocols

    func numberOfSections(in tableView: UITableView) -> Int {
        // Return the number of colums to be displayed in tableView
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // This will return the amount of rows to be dis[;ayed in tableVoew
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // This creates the cell and then returns it
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
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
    
}


























