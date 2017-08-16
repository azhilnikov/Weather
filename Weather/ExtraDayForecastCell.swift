//
//  ExtraDayForecastCell.swift
//  Weather
//
//  Created by Alexey on 16/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import UIKit

enum ExtraForecastType: Int {
    case rain
    case humidity
    case pressure
    case wind
}

class ExtraDayForecastCell: UITableViewCell {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func setup(rain: Double?, humidity: Double?, pressure: String?, wind: Wind?) {
        if let rainValue = rain {
            rainTitle = "\(Int(rainValue))% chance of rain"
        }
        if let humidityValue = humidity {
            humidityTitle = "\(Int(humidityValue))% humidity"
        }
        if let pressureValue = pressure {
            pressureTitle = "Air pressure \(pressureValue)"
        }
        if let windDirection = wind?.direction, let windSpeed = wind?.speed {
            windTitle = "\(windDirection) wind, \(Int(windSpeed))m/s"
        }
        collectionView.reloadData()
    }
    
    fileprivate var rainTitle: String?
    fileprivate var humidityTitle: String?
    fileprivate var pressureTitle: String?
    fileprivate var windTitle: String?
}

extension ExtraDayForecastCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ExtraDayForecastCollectionViewCell",
                                                      for: indexPath) as! ExtraDayForecastCollectionViewCell
        
        guard let row = ExtraForecastType(rawValue: indexPath.row) else {
            fatalError()
        }
        
        switch row {
        case .rain:
            cell.title = rainTitle
        case .humidity:
            cell.title = humidityTitle
        case .pressure:
            cell.title = pressureTitle
        case .wind:
            cell.title = windTitle
        }
        
        return cell
    }
}

extension ExtraDayForecastCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = max(160, collectionView.frame.width / 4)
        return CGSize(width: width, height: collectionView.frame.height)
    }
}
