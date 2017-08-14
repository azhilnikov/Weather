//
//  City.swift
//  Weather
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Gloss

struct City: Decodable {
    
    let name: String?
    let country: String?
    let latitude: Double?
    let longitude: Double?
    let temperature: Double?
    let minTemperature: Double?
    let maxTemperature: Double?
    let shortDescription: String?
    
    init?(json: JSON) {
        self.name = "name" <~~ json
        self.country = "country" <~~ json
        self.latitude = "lat" <~~ json
        self.longitude = "long" <~~ json
        self.temperature = "temp" <~~ json
        self.minTemperature = "minTemp" <~~ json
        self.maxTemperature = "maxTemp" <~~ json
        self.shortDescription = "shortDescription" <~~ json
    }
}
