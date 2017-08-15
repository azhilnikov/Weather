//
//  DetailedWeatherForecastViewController.swift
//  Weather
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import UIKit

class DetailedWeatherForecastViewController: UIViewController {
    
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var shortDescrptionLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var feelsLikeLabel: UILabel!
    @IBOutlet private weak var forecastTableView: UITableView!

    var cityName: String?
    var shortDescription: String?
    
    private let detailedWeatherDataProvider = DetailedWeatherDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastTableView.dataSource = detailedWeatherDataProvider
        forecastTableView.delegate = detailedWeatherDataProvider
        /*guard let fileName = cityName?.lowercased().replacingOccurrences(of: " ", with: "") else {
            return
        }*/
        
        //JSONFileReader.readFile(fileName, withExtension: "json")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
