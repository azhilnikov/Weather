//
//  WeekForecast.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Gloss

struct WeekForecast: Decodable {
    
    let longDescription: String?
    let feelsLike: Double?
    let rainChance: Double?
    let humidity: Double?
    let airPressure: String?
    let wind: Wind?
    let sevenDay: SevenDay?
    
    init?(json: JSON) {
        self.longDescription = "longDescription" <~~ json
        self.feelsLike = "feelsLike" <~~ json
        self.rainChance = "rainChance" <~~ json
        self.humidity = "humidity" <~~ json
        self.airPressure = "airPressure" <~~ json
        self.wind = "wind" <~~ json
        self.sevenDay = "sevenDay" <~~ json
    }
}
