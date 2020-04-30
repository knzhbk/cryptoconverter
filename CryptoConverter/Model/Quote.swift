//
//  Quote.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/14/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation

struct Quote {
    var name: String
    var currentPrice: Double
    
    static func createQuoteArray() -> Array<Quote> {
//        let BTC = Quote(name: "BTC", currentPrice: 10000.00)
//        let ETH = Quote(name: "ETH", currentPrice: 200.00)
        let BTC = Quote(name: "BTC", currentPrice: Quote.randomPrice())
        let ETH = Quote(name: "ETH", currentPrice: Quote.randomPrice())
        let XRP = Quote(name: "XRP", currentPrice: Quote.randomPrice())
        let BCH = Quote(name: "BCH", currentPrice: Quote.randomPrice())
        let BCV = Quote(name: "BCV", currentPrice: Quote.randomPrice())
        
        let quoteArray = [BTC, ETH, XRP,BCH, BCV]

        return quoteArray
    }
    
    static func randomPrice() -> Double{
        return Double.random(in: 0 ... 10000)
    }
}
