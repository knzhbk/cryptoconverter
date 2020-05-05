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
        return (amount*convertQuote.price)/baseQuote.price
    }
}
