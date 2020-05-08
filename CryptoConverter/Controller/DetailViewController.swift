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
            detailLogo.sd_setImage(with: URL(string: quote.logo_url), placeholderImage: #imageLiteral(resourceName: "placeholder_currency"))
            detailLogo.sd_imageTransition = .flipFromTop
            highTimestamp.text = "High timestamp: \(quote.high_timestamp ?? "Not provided")"
            high.text = "High: \(quote.high ?? "Not provided")"
            circulatingSupply.text = "Circ supply: \(quote.circulating_supply ?? "Not provided")"
            priceTimestamp.text = "Price timestamp: \(quote.price_timestamp)"
            priceDate.text = "Price date: \(quote.price_date)"
            price.text = "Price: \(quote.price)"
        }
    }
}
