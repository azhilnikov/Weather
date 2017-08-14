//
//  CountryStorage.swift
//  Weather
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Foundation

struct CityNameTemperature {
    let name: String?
    let temperature: Double?
}

class CountryStorage {
    
    var numberOfCountries: Int {
        return countryDictionary.count
    }
    
    func parse(jsonData: Weather?) {
        guard let weather = jsonData else {
            return
        }
        
        guard let cities = weather.cities else {
            return
        }
        
        for city in cities {
            self.append(country: city.country, city: city)
        }
        countries.sort()
    }
    
    func numberOfCities(at countryIndex: Int) -> Int {
        if let cities = citiesAt(countryIndex) {
            return cities.count
        }
        return 0
    }
    
    func countryTitle(at index: Int) -> String? {
        return index < countries.count ? countries[index] : nil
    }
    
    func cityTitle(at indexPath: IndexPath) -> String? {
        if let city = cityAt(indexPath) {
            return city.name
        }
        return nil
    }
    
    func cityNameTemperature(indexPath: IndexPath) -> CityNameTemperature? {
        if let city = cityAt(indexPath) {
            return CityNameTemperature(name: city.name, temperature: city.temperature)
        }
        return nil
    }
    
    private var countryDictionary = [String: [City]]()
    private var countries = [String]()
    
    // MARK: - Private methods
    
    private func append(country: String?, city: City) {
        guard let country = country else {
            return
        }
        
        if let _ = countryDictionary[country] {
            countryDictionary[country]!.append(city)
        } else {
            countries.append(country)
            countryDictionary[country] = [city]
        }
    }
    
    private func citiesAt(_ countryIndex: Int) -> [City]? {
        return countryIndex < countries.count ? countryDictionary[countries[countryIndex]] : nil
    }
    
    private func cityAt(_ indexPath: IndexPath) -> City? {
        let countryIndex = indexPath.section
        if countryIndex < countries.count {
            let country = countries[countryIndex]
            if let cities = countryDictionary[country] {
                let cityIndex = indexPath.row
                if cityIndex < cities.count {
                    return cities[cityIndex]
                }
            }
        }
        return nil
    }
}
