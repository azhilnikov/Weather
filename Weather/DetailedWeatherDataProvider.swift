//
//  DetailedWeatherDataProvider.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import UIKit

class DetailedWeatherDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    func fetchFor(_ cityName: String?, completion: (WeatherResult) -> Void) {
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeeklyForecastCell", for: indexPath)
        return cell
    }
}
