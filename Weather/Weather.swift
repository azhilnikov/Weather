//
//  Weather.swift
//  Weather
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Gloss

struct Weather: Decodable {
    
    let cities: [City]?
    
    init?(json: JSON) {
        self.cities = "cities" <~~ json
    }
}
