//
//  JSONFileReader.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Foundation

class JSONFileReader {
    
    class func readFile(_ name: String, withExtension: String) throws -> AnyObject {
        guard let weatherURL = Bundle.main.url(forResource: name, withExtension: withExtension) else {
            throw WeatherResult.failure("File \(name).\(withExtension) not found")
        }
        guard let data = try? Data(contentsOf: weatherURL) else {
            throw WeatherResult.failure("Can't read file \(name).\(withExtension)")
        }
        guard let json = try? JSONSerialization.jsonObject(with: data,
                                                           options: .allowFragments) as AnyObject else {
            throw WeatherResult.failure("Can't serialize JSON data from \(name).\(withExtension)")
        }
        return json
    }
}
