//
//  Wind.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Gloss

struct Wind: Decodable {
    
    let direction: String?
    let speed: Double?
    
    init?(json: JSON) {
        self.direction = "direction" <~~ json
        self.speed = "speed" <~~ json
    }
}
