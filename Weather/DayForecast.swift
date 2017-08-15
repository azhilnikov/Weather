//
//  DayForecast.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Gloss

struct DayForecast: Decodable {
    
    let minTemp: Double?
    let maxTemp: Double?
    let shortDescription: String?
    
    init?(json: JSON) {
        self.minTemp = "minTemp" <~~ json
        self.maxTemp = "maxTemp" <~~ json
        self.shortDescription = "shortDescription" <~~ json
    }
}
