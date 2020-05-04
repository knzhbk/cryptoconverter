//
//  QuoteProvider.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/17/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation

let QUOTES_SENT_NOTIFICATION = NSNotification.Name("QUOTES_SENT")
let QUOTES_REQUESTED_NOTIFICATION = NSNotification.Name("QUOTES_REQUESTED")
let TIME_INTERVAL_MIN = 5 * 60.0

class QuoteProvider {
    var timer: Timer?
    var quotes: [Quote] = []
    
    func start() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(sendQuoteArray),
                                               name: QUOTES_REQUESTED_NOTIFICATION,
                                               object: nil)

        updateQuotes()

        timer = Timer.scheduledTimer(
            withTimeInterval: TIME_INTERVAL_MIN,
            repeats: true,
            block: { _ in self.updateQuotes() }
        )
    }
    
    func updateQuotes() {
        quotes = self.createQuoteArray()
        sendQuoteArray()
    }
    
    @objc func sendQuoteArray() {
        NotificationCenter.default.post(name: QUOTES_SENT_NOTIFICATION, object: quotes)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func createQuoteArray() -> [Quote] {
        let btcLogoUrl = "https://g7.pngresmi.com/preview/426/45/109/bitcointalk-clip-art-mongolia-brand-bitcoin.jpg"
        let ETHLogoUrl = "https://img.favpng.com/7/6/20/ethereum-bitcoin-blockchain-cryptocurrency-smart-contract-png-favpng-AYevdXZqWqE14x4zNZcJvK8QV.jpg"
        let XRPLogoUrl = "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/512/Ripple-XRP-icon.png"
        let USDTLogoUrl = "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/512/Tether-USDT-icon.png"
        let BCHTLogoUrl = "https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/512/Bitcoin-Cash-BCH-icon.png"
        
        let BTC = Quote(id:"BTC", symbol:"BTC", name:"Bitcoin", logo_url:btcLogoUrl, rank:1,
                        price:randomPrice(), priceDate:"2020-04-17T00:00:00Z",
                        price_timestamp:"2020-04-17T09:13:00Z", market_cap:"129749194850",
                        circulating_supply:"18329800", max_supply:"21000000",
                        d:["price_change" : "54.34287670"],
                        high:"19381.94110067", high_stamp:"2017-12-16T00:00:00Z")
        
        let ETH = Quote(id: "ETH", symbol:"ETH", name:"Ethereum", logo_url:ETHLogoUrl, rank: 2,
                        price:randomPrice(),priceDate:"2020-04-17T00:00:00Z",
                        price_timestamp:"2020-04-17T09:16:00Z", market_cap:"18923034598",
                        circulating_supply: "110553290", max_supply:"2345676543",
                        d:["price_change": "2.93761602"],
                        high:"1399.57967546", high_stamp:"018-01-13T00:00:00Z")
        
        let XRP = Quote(id: "XRP", symbol: "XRP", name: "Ripple", logo_url: XRPLogoUrl, rank: 3,
                        price: randomPrice(), priceDate: "2020-04-17T00:00:00Z",
                        price_timestamp: "2020-04-17T09:16:00Z", market_cap: "8307712372",
                        circulating_supply: "44089620959", max_supply: "100000000000",
                        d: ["price_change": "0.00027881"],
                        high: "2.78141401", high_stamp: "2018-01-07T00:00:00Z")
        
        let USDT = Quote(id: "USDT", symbol: "USDT", name: "Tether", logo_url: USDTLogoUrl, rank: 4,
                         price: randomPrice(), priceDate: "2020-04-17T00:00:00Z",
                         price_timestamp: "2020-04-17T09:16:00Z", market_cap: "6927989312",
                         circulating_supply: "6917756658", max_supply: "76543567876",
                         d: ["price_change": "0.00027845435681"],
                         high: "1.72341401", high_stamp: "2017-12-07T00:00:00Z")
        
        let BCH = Quote(id: "BCH", symbol: "BCH", name: "Bitcoin Cash", logo_url: BCHTLogoUrl, rank: 5,
                        price: randomPrice(), priceDate: "2020-04-17T00:00:00Z",
                        price_timestamp: "2020-04-17T09:16:00Z", market_cap: "4297500896",
                        circulating_supply: "18382321", max_supply: "21000000",
                        d: ["price_change": "3.58265427"],
                        high: "3765.72341401", high_stamp: "2017-12-20T00:00:00Z")
        
        let quoteArray = [BTC, ETH, XRP, USDT, BCH]
        
        return quoteArray
    }

    func randomPrice() -> Double{
        return Double.random(in: 0 ... 10000)
    }
}
