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
    
    private let weatherDataProvider = WeatherDataProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTableView.dataSource = weatherDataProvider
        weatherTableView.delegate = weatherDataProvider
        
        weatherDataProvider.delegate = self
        
        weatherTableView.estimatedRowHeight = 50
        weatherTableView.rowHeight = UITableViewAutomaticDimension
        weatherTableView.sectionHeaderHeight = 50
        
        weatherDataProvider.fetchWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? DetailedWeatherForecastViewController {
            viewController.cityName = sender as? String
        }
    }
}

extension WeatherViewController: WeatherDataProviderDelegate {
    
    func didSelectCity(_ name: String) {
        performSegue(withIdentifier: "ShowDetailedForecast", sender: name)
    }
}
