//
//  SevenDay.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Gloss

struct SevenDay: Decodable {
    
    let monday: DayForecast?
    let tuesday: DayForecast?
    let wednesday: DayForecast?
    let thursday: DayForecast?
    let friday: DayForecast?
    let saturday: DayForecast?
    let sunday: DayForecast?
    
    init?(json: JSON) {
        self.monday = "Monday" <~~ json
        self.tuesday = "Tuesday" <~~ json
        self.wednesday = "Wednesday" <~~ json
        self.thursday = "Thursday" <~~ json
        self.friday = "Friday" <~~ json
        self.saturday = "Saturday" <~~ json
        self.sunday = "Sunday" <~~ json
    }
}
