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
    
    func setup(_ city: City?) {
        cityLabel?.text = city?.name
        if let temperature = city?.temperature {
            temperatureLabel?.text = "\(Int(temperature))º"
        }
    }
}
