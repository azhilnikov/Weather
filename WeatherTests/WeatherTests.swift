//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import XCTest
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
    
    func testWeatherDataSource() {
        let weatherDataSource = WeatherDataSource()
        weatherDataSource.fetchWeather()
    }
}
