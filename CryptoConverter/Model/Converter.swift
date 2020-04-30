//
//  Converter.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/14/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation

class Converter {
    var baseQuote: Quote
    
    init(baseQuote: Quote) {
        self.baseQuote = baseQuote
    }
    
    func convert(amount: Double, convertQuote: Quote) -> Double {
        return (amount*convertQuote.currentPrice)/baseQuote.currentPrice
        
    }
    
    
    

}
