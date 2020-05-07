//
//  QuoteProvider.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/17/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation

let TIME_INTERVAL_MIN = 5 * 60.0

class QuoteProvider {
    var timer: Timer?
    var requestedQuotes: [Quote] = []
    
    func start() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(sendQuoteArray),
                                               name: .quotesRequestedNotification,
                                               object: nil)

        updateQuotes()

        timer = Timer.scheduledTimer(
            withTimeInterval: TIME_INTERVAL_MIN,
            repeats: true,
            block: { _ in self.updateQuotes() }
        )
    }
    
    func updateQuotes() {
        requestedQuotes = getQuotesArray()
        sendQuoteArray()
    }
    
    @objc func sendQuoteArray() {
        NotificationCenter.default.post(name: .quotesSentNotification, object: requestedQuotes)
        print(requestedQuotes)
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    func getQuotesArray() -> [Quote] {
        let quoteAdress = "https://api.nomics.com/v1/currencies/ticker?key=3c8c0907276523d0ff0e94c50657de0c&format=json&interval=5m&convert=USD"
        
        
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
                        self.requestedQuotes = try JSONDecoder().decode([Quote].self, from: data)
                        DispatchQueue.main.async {
                            self.sendQuoteArray()
                            print(self.requestedQuotes)
                        }
                    }
                    catch {
                        print("Decoding JSON failure: \(error)")
                    }
                }
                
            }
            quoteLoadTask.resume()
        }
        
        return requestedQuotes
    }
}
