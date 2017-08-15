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
    @IBOutlet private weak var longDescrptionLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var feelsLikeLabel: UILabel!
    @IBOutlet private weak var forecastTableView: UITableView!

    var cityName: String?
    var temperature: Double?
    
    private let detailedWeatherDataProvider = DetailedWeatherDataProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        forecastTableView.dataSource = detailedWeatherDataProvider
        forecastTableView.delegate = detailedWeatherDataProvider
        
        let fileName = cityName?.lowercased().replacingOccurrences(of: " ", with: "")
        detailedWeatherDataProvider.fetchFor(fileName) { [weak self] (result) in
            switch result {
            case .success:
                self?.cityNameLabel?.text = self?.cityName
                self?.longDescrptionLabel?.text = self?.detailedWeatherDataProvider.longDescription
                if let temperature = self?.temperature {
                    self?.temperatureLabel?.text = String(format: "%.1fº", temperature)
                }
                self?.feelsLikeLabel?.text = self?.detailedWeatherDataProvider.feelsLike
                
            case .failure(let errorDescription):
                print(errorDescription)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
