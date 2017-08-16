//
//  ExtraDayForecastCollectionViewCell.swift
//  Weather
//
//  Created by Alexey on 16/8/17.
//  Copyright © 2017 Alexey Zhilnikov. All rights reserved.
//

import UIKit

class ExtraDayForecastCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        willSet {
            titleLabel?.text = newValue
        }
    }
}
