//
//  QuoteProvider.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/17/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation
import RealmSwift

//let TIME_INTERVAL_MIN = 5 * 60.0
let TIME_INTERVAL_MIN = 5.0

class QuoteProvider {
    var timer: Timer?
    var fetchedQuotes: [Quote] = []
    
    func start() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(sendFetchedQuotes),
                                               name: .quotesRequestedNotification,
                                               object: nil)
        
        loadQuotesFromCache()
        loadQuotesFromAPI()
        
        timer = Timer.scheduledTimer(
            withTimeInterval: TIME_INTERVAL_MIN,
            repeats: true,
            block: { _ in self.loadQuotesFromAPI() }
        )
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func loadQuotesFromCache() {
        var cachedQuotes: [Quote] = []

        do {
            let realm = try Realm()
            let quotesArray = realm.objects(Quote.self)
            
            for object in quotesArray {
                cachedQuotes.append(object)
            }
        } catch {
            print("Caching Error:\(error)")
        }

        fetchedQuotes = cachedQuotes
        sendFetchedQuotes()
    }
    
    func loadQuotesFromAPI() {
        let baseUrl = "https://api.nomics.com/v1/currencies/ticker"
        let apiKey = "key=3c8c0907276523d0ff0e94c50657de0c"
        let format = "format=json"
        let timeInterval = "interval=5m"
        let currency = "convert=USD"

        let quoteAdress = "\(baseUrl)?\(apiKey)&\(format)&\(timeInterval)&\(currency)"

        if let url = URL(string: quoteAdress) {
            let quoteLoadTask = URLSession.shared.dataTask(with: url){
                [weak self]
                (data, response, error)
                in
                guard let self = self else {
                    return
                }
                if let data = data {
                    do {
                        let receivedQuotes: [Quote] = try JSONDecoder().decode([Quote].self, from: data)

                        DispatchQueue.main.async {
                            self.fetchedQuotes = receivedQuotes
                            self.saveQuotesInCache(quotes: self.fetchedQuotes)
                            self.sendFetchedQuotes()
                        }
                    }
                    catch {
                        print("Decoding JSON failure: \(error)")
                    }
                }
            }
            quoteLoadTask.resume()
        }
    }
    
    func saveQuotesInCache(quotes: [Quote]) {
        do {
            let realm = try Realm()
            try realm.write {
                for quote in quotes {
                    realm.add(quote)
                }
            }
        } catch {
            print("Caching Error:\(error)")
        }
    }
    
    @objc func sendFetchedQuotes() {
        NotificationCenter.default.post(name: .quotesSentNotification, object: fetchedQuotes)
    }
}
