//
//  WeatherViewController.swift
//  Weather
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet private weak var weatherTableView: UITableView!
    
    private let weatherDataSource = WeatherDataSource()
    private let weatherDelegate = WeatherDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.dataSource = weatherDataSource
        weatherTableView.delegate = weatherDelegate
        
        weatherTableView.estimatedRowHeight = 50
        weatherTableView.rowHeight = UITableViewAutomaticDimension
        weatherTableView.sectionHeaderHeight = 50
        //weatherTableView.sectionFooterHeight = CGFloat.leastNonzeroMagnitude
        
        weatherDataSource.fetchWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
