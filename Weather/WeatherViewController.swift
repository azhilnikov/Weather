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
        
        weatherTableView.estimatedRowHeight = 50
        weatherTableView.rowHeight = UITableViewAutomaticDimension
        weatherTableView.sectionHeaderHeight = 50
        
        weatherDataProvider.delegate = self
        
        weatherTableView.dataSource = weatherDataProvider
        weatherTableView.delegate = weatherDataProvider
        
        weatherDataProvider.fetch { [weak self] (result) in
            switch result {
            case .success:
                self?.weatherTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? DetailedWeatherForecastViewController,
            let data = sender as? (name: String, forecast: String) {
            viewController.cityName = data.name
            viewController.shortDescription = data.forecast
        }
    }
}

extension WeatherViewController: WeatherDataProviderDelegate {
    
    func didSelectCity(_ name: String, withForecast: String) {
        performSegue(withIdentifier: "ShowDetailedForecast", sender: (name, withForecast))
    }
}
