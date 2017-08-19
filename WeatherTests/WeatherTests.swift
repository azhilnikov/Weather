//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import XCTest
import Gloss
@testable import Weather

class WeatherTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJSONFileReader() {
        do {
            _ = try JSONFileReader.readFile("seattle", withExtension: "json")
        } catch {
            XCTFail("JSON file read error")
        }
    }
    
    func testWeatherDataProvider() {
        let weatherDataProvider = WeatherDataProvider()
        weatherDataProvider.fetch { (result) in
            switch result {
            case .success:
                break
                
            case .failure(let description):
                XCTFail(description)
            }
        }
    }
    
    func testDetailedWeatherDataProvider() {
        let detailedWeatherDataProvider = DetailedWeatherDataProvider()
        detailedWeatherDataProvider.fetchFor("london") { (result) in
            switch result {
            case .success:
                break
                
            case .failure(let description):
                XCTFail(description)
            }
        }
    }
    
    func testCountryStorage() {
        let countryStorage = CountryStorage()
        do {
            let json = try JSONFileReader.readFile("weather", withExtension: "json")
            guard let jsonData = json as? JSON, let weather = Weather(json: jsonData) else {
                XCTFail("JSON format error")
                return
            }
            
            try countryStorage.parse(jsonData: weather)
            XCTAssertEqual(countryStorage.numberOfCountries, 4)
            XCTAssertEqual(countryStorage.numberOfCities(at: 0), 8)
            XCTAssertEqual(countryStorage.numberOfCities(at: 1), 1)
            XCTAssertEqual(countryStorage.numberOfCities(at: 2), 1)
            XCTAssertEqual(countryStorage.numberOfCities(at: 3), 3)
            
            let countryDictionary: [Int: String] = [
                0: "Australia",
                1: "England",
                2: "Netherlands",
                3: "United States"
            ]
            
            for index in 0..<countryStorage.numberOfCountries {
                guard let country = countryStorage.countryTitle(at: index) else {
                    XCTFail("Country title error at index \(index)")
                    return
                }
                XCTAssertEqual(country, countryDictionary[index]!)
            }
            
            let londonIndexPath = IndexPath(item: 0, section: 1)
            if let cityName = countryStorage.cityAt(londonIndexPath)?.name {
                XCTAssertEqual(cityName, "London")
            } else {
                XCTFail("London city name error")
            }
            
            let seattleIndexPath = IndexPath(item: 2, section: 3)
            if let cityName = countryStorage.cityAt(seattleIndexPath)?.name {
                XCTAssertEqual(cityName, "Seattle")
            } else {
                XCTFail("Seattle city name error")
            }
        } catch {
            XCTFail("JSON file read error")
        }
    }
}
