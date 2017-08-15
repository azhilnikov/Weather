//
//  DayForecastCell.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import UIKit

class DayForecastCell: UITableViewCell {
    
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    func setupDay(_ day: String?, forecast: DayForecast?) {
        if let day = day {
            dayLabel?.text = "\(day):"
        }
        
        if let description = forecast?.shortDescription,
            let minTemp = forecast?.minTemp, let maxTemp = forecast?.maxTemp {
            descriptionLabel?.text = "\(description) - \(Int(minTemp))º to \(Int(maxTemp))º"
        }
    }
}
