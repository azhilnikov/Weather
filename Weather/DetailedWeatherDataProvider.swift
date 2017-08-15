//
//  DetailedWeatherDataProvider.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Gloss

class DetailedWeatherDataProvider: NSObject {
    
    var longDescription: String? {
        return weekForecast?.longDescription
    }
    
    var feelsLike: String? {
        if let value = weekForecast?.feelsLike {
            return "Feels like \(Int(value))º"
        }
        return nil
    }
    
    func fetchFor(_ cityName: String?, completion: (WeatherResult) -> Void) {
        guard let fileName = cityName else {
            completion(.failure("File name is nil"))
            return
        }
        
        do {
            let json = try JSONFileReader.readFile(fileName, withExtension: "json")
            guard let jsonData = json as? JSON, let forecast = WeekForecast(json: jsonData) else {
                completion(.failure("Invalid JSON format"))
                return
            }
            weekForecast = forecast
            completion(.success)
        } catch let error {
            completion(.failure("\(error)"))
        }
    }
    
    fileprivate var weekForecast: WeekForecast?
    
    fileprivate enum DetailedWeatherTableViewSection: Int {
        case extraDetails
        case weekDays
        
        static var count: Int {
            return self.weekDays.rawValue + 1
        }
    }
}

extension DetailedWeatherDataProvider: UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailedWeatherTableViewSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = DetailedWeatherTableViewSection(rawValue: section) else {
            fatalError()
        }
        
        switch section {
        case .extraDetails:
            return 0
        case .weekDays:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = DetailedWeatherTableViewSection(rawValue: indexPath.section) else {
            fatalError()
        }
        
        switch section {
        case .extraDetails:
            return UITableViewCell()
        case .weekDays:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DayForecastCell", for: indexPath) as! DayForecastCell
            return cell
        }
    }
}

extension DetailedWeatherDataProvider: UITableViewDelegate {
}
