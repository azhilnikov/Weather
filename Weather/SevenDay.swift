//
//  SevenDay.swift
//  Weather
//
//  Created by Alexey on 15/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import Gloss

struct SevenDay: Decodable {
    
    let monday: DayForecast?
    let tuesday: DayForecast?
    let wednesday: DayForecast?
    let thursday: DayForecast?
    let friday: DayForecast?
    let saturday: DayForecast?
    let sunday: DayForecast?
    
    init?(json: JSON) {
        self.monday = WeekDay.monday.rawValue <~~ json
        self.tuesday = WeekDay.tuesday.rawValue <~~ json
        self.wednesday = WeekDay.wednesday.rawValue <~~ json
        self.thursday = WeekDay.thursday.rawValue <~~ json
        self.friday = WeekDay.friday.rawValue <~~ json
        self.saturday = WeekDay.saturday.rawValue <~~ json
        self.sunday = WeekDay.sunday.rawValue <~~ json
        self.sevenDayForecast = [
            .monday: monday,
            .tuesday: tuesday,
            .wednesday: wednesday,
            .thursday: thursday,
            .friday: friday,
            .saturday: saturday,
            .sunday: sunday
        ]
    }
    
    func weekDayFor(_ index: Int) -> String? {
        return 0 == index ? WeekDay.tomorrow.rawValue : fullWeekDayFor(index + 1)
    }
    
    func weekDayForecastFor(_ index: Int) -> DayForecast? {
        if let day = fullWeekDayFor(index + 1), let weekDay = WeekDay(rawValue: day) {
            return sevenDayForecast[weekDay] ?? nil
        }
        return nil
    }
    
    // Return a full week day name for a given index
    
    private func fullWeekDayFor(_ index: Int) -> String? {
        if let newDate = Calendar.current.date(byAdding: .day, value: index, to: Date()) {
            return self.dateFormatter.string(from: newDate)
        }
        return nil
    }
    
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter
    }()
    
    private let sevenDayForecast: [WeekDay: DayForecast?]
    
    private enum WeekDay: String {
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
        case saturday = "Saturday"
        case sunday = "Sunday"
        case tomorrow = "Tomorrow"
    }
}
