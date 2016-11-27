//
//  DayViewController.swift
//  Weatherly
//
//  Created by Ryan Maugin on 26/11/2016.
//  Copyright © 2016 MauginApps. All rights reserved.
//

import UIKit

class DayViewController: UIViewController {
    
    //// Variables
    private var _testString: String!
    var testString: String {
        get {
            return _testString
        } set {
            _testString = newValue
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // This will run when the view is loaded
        
        print(_testString)
    }

}
