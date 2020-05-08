//
//  Quote.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/14/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation
import RealmSwift

class Quote: Object, Decodable {
    @objc dynamic var id: String
    @objc dynamic var currency: String
    @objc dynamic var symbol: String
    @objc dynamic var name: String
    @objc dynamic var logo_url: String
    @objc dynamic var rank: String
    @objc dynamic var price: String
    @objc dynamic var price_date: String
    @objc dynamic var price_timestamp: String
    @objc dynamic var market_cap: String?
    @objc dynamic var circulating_supply: String?
    @objc dynamic var max_supply: String?
    @objc dynamic var high: String?
    @objc dynamic var high_timestamp: String?
}
