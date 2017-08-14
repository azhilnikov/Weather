//
//  WeatherDataSource.swift
//  Weather
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import UIKit
import Gloss

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    private let countryStorage = CountryStorage()
    
    func fetchWeather() {
        if let weatherURL = Bundle.main.url(forResource: "weather", withExtension: "json"),
            let weatherData = try? Data(contentsOf: weatherURL) {
            if let json = try? JSONSerialization.jsonObject(with: weatherData, options: .allowFragments) as AnyObject {
                if let jsonData = json as? JSON, let weather = Weather(json: jsonData) {
                    countryStorage.parse(jsonData: weather)
                }
            }
        }
    }
    
    // MARK: - Table view data sources
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countryStorage.numberOfCountries
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryStorage.numberOfCities(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherCell", for: indexPath) as! CityWeatherCell
        cell.setup(countryStorage.cityNameTemperature(indexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countryStorage.countryTitle(at: section)
    }
}
