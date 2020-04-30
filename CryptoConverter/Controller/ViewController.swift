//
//  ViewController.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/14/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//
/*
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var quoteList: UILabel!
    @IBOutlet weak var currencyRateLabel: UILabel!
    
//    let quotes: Array<Quote> = QuoteProvider.createQuoteArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var quotesRepresentation = ""
        for quote in quotes {
            let quotePrice = String(format: "$%.02f", quote.price)
            let quoteRepresentation = "\(quote.name)  \(quotePrice) \n"
            quotesRepresentation = quotesRepresentation + quoteRepresentation
        }
        quoteList.text = quotesRepresentation
    }
    
    @IBAction func showQuote(_ sender: UIButton) {
        let fromQuote = quotes[1]
        let toQuote = quotes[0]
        let myConverter = Converter(baseQuote: fromQuote)
        let fromAmount = 5.00
        let toAmount = myConverter.convert(amount: fromAmount, convertQuote: toQuote)
        
        currencyRateLabel.text =
            String(format: "Result: %.02f %@ is %.02f %@", fromAmount,fromQuote.name, toAmount,toQuote.name)
    }
}

*/
