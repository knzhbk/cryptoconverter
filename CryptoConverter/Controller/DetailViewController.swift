//
//  DetailViewController.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/18/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var quote: Quote?
    
    @IBOutlet weak var market_cap: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var max_supply: UILabel!
    @IBOutlet weak var detailLogo: UIImageView!
    @IBOutlet weak var highTimestamp: UILabel!
    @IBOutlet weak var high: UILabel!
    @IBOutlet weak var circulatingSupply: UILabel!
    @IBOutlet weak var priceTimestamp: UILabel!
    @IBOutlet weak var priceDate: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let quote = quote {
            market_cap.text = "Market cap: \(quote.market_cap ?? "Not provided")"
            name.text = "Name: \(quote.name)"
            max_supply.text = "Max supply: \(quote.max_supply ?? "Not provided")"
            if let url = URL(string: quote.logo_url) {detailLogo.load(url: url)}
            highTimestamp.text = "High timestamp: \(quote.high_timestamp)"
            high.text = "High: \(quote.high)"
            circulatingSupply.text = "Circ supply: \(quote.circulating_supply ?? "Not provided")"
            priceTimestamp.text = "Price timestamp: \(quote.price_timestamp)"
            priceDate.text = "Price date: \(quote.price_date)"
            price.text = "Price: \(quote.price)"
        }
    }
}
