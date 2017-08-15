//
//  WeatherResult.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Foundation

enum WeatherResult: Error {
    case success
    case failure(String)
}
