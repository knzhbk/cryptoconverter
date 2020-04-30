//
//  QuoteTableViewCell.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/18/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var symbol: UILabel!
    @IBOutlet weak var circulating_supply: UILabel!
    @IBOutlet weak var max_supply: UILabel!
    @IBOutlet weak var price_stamp: UILabel!
    @IBOutlet weak var market_cap: UILabel!
    @IBOutlet weak var price_date: UILabel!
    @IBOutlet weak var rank: UILabel!
    @IBOutlet weak var logo: UIImageView!
}
