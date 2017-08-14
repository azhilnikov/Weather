//
//  CityWeatherCell.swift
//  Weather
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import UIKit

class CityWeatherCell: UITableViewCell {

    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    
    func setup(_ data: CityNameTemperature?) {
        cityLabel?.text = data?.name
        if let temperature = data?.temperature {
            temperatureLabel?.text = "\(Int(temperature))º"
        }
    }
}
