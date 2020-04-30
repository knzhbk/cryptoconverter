//
//  Quote.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/14/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation

struct Quote {
    var id: String
    var symbol: String
    var name: String
    var logo_url: String
    var rank: Int
    var price: Double
    var priceDate: String
    var price_timestamp: String
    var market_cap: String
    var circulating_supply: String
    var max_supply: String
    var d: Dictionary<String, String>
    var high: String
    var high_stamp: String
}
