//
//  InfoDataCollectionViewCell.swift
//  loop
//
//  Created by Michal Šimík on 14.05.2022.
//

import UIKit

class InfoDataCollectionViewCell: UICollectionViewCell {

    @IBOutlet private var iconImageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!

    func configure(cellModel: InfoDataCollectionViewCellModel) {
        // TODO: - configure with data
    }
}
