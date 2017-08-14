//
//  WeatherDelegate.swift
//  Weather
//
//  Created by Alexey on 14/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import UIKit

protocol WeatherDelegateProtocol: class {
    func didSelectCity(_ name: String)
}

class WeatherDelegate: NSObject, UITableViewDelegate {
    
    weak var delegate: WeatherDelegateProtocol?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cityTitle = countryStorage.cityTitle(at: indexPath) {
            delegate?.didSelectCity(cityTitle)
        }
    }
    
    private let countryStorage = CountryStorage()
}
