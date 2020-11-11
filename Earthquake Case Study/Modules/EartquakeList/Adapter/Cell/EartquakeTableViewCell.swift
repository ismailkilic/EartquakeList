//
//  EartquakeTableViewCell.swift
//  Earthquake Case Study
//
//  Created by İsmail KILIÇ on 11.11.2020.
//  Copyright © 2020 İsmail KILIÇ. All rights reserved.
//

import UIKit

class EartquakeTableViewCell: UITableViewCell {

    @IBOutlet private weak var lblLocation: UILabel!
    @IBOutlet private weak var lblLong: UILabel!
    @IBOutlet private weak var lblLat: UILabel!
    @IBOutlet private weak var lblSize: UILabel!

    var model: Earthquake? {
        didSet {
            lblLocation.text = model?.humanReadableLocation

            lblLat.text = "latitude: \(model?.latitude ?? 0)"
            lblLong.text = "longitude: \(model?.longitude ?? 0)"
            lblSize.text = "size: \(model?.size ?? 0)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
