//
//  Converter.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/14/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation

class Converter {
    
    func convert(baseQuote: Quote, convertQuote: Quote, amount: Double) -> Double {
        guard let basePrice = Double(baseQuote.price) else { return 0.0 }
        let convertPrice = Double(convertQuote.price) ?? 0.0
        return (amount * convertPrice)/basePrice
    }
}
