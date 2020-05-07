//
//  Quote.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/14/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation

struct Quote: Decodable {
    var id: String
    var currency: String
    var symbol: String
    var name: String
    var logo_url: String
    var rank: String
    var price: String
    var price_date: String
    var price_timestamp: String
    var market_cap: String?
    var circulating_supply: String?
    var max_supply: String?
    var high: String
    var high_timestamp: String
}
