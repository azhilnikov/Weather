//
//  WeatherDataProvider.swift
//  Weather
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Gloss

protocol WeatherDataProviderDelegate: class {
    func didSelectCity(_ name: String, temperature: Double)
}

class WeatherDataProvider: NSObject {
    
    weak var delegate: WeatherDataProviderDelegate?
    
    func fetch(completion: (WeatherResult) -> Void) {
        do {
            let json = try JSONFileReader.readFile("weather", withExtension: "json")
            guard let jsonData = json as? JSON, let weather = Weather(json: jsonData) else {
                completion(.failure("Invalid JSON format"))
                return
            }
            try countryStorage.parse(jsonData: weather)
            completion(.success)
        } catch let error {
            completion(.failure("\(error)"))
        }
    }
    
    fileprivate let countryStorage = CountryStorage()
}

extension WeatherDataProvider: UITableViewDataSource {
    
    // MARK: - Table view data sources
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return countryStorage.numberOfCountries
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryStorage.numberOfCities(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityWeatherCell", for: indexPath) as! CityWeatherCell
        cell.setup(countryStorage.cityAt(indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countryStorage.countryTitle(at: section)
    }
}

extension WeatherDataProvider: UITableViewDelegate {
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let city = countryStorage.cityAt(indexPath),
            let cityName = city.name, let temperature = city.temperature {
            delegate?.didSelectCity(cityName, temperature: temperature)
        }
    }
}
