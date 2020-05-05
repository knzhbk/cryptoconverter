//
//  QuotesTableViewController.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/18/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController {
    var dataArray: [Quote] = []
    var isSelectQuoteMode = false
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        NotificationCenter.default.addObserver(self ,
                                               selector: #selector(reciveQuotesNotification),
                                               name: .quotesSentNotification,
                                               object: nil)
    }
    
    @objc func reciveQuotesNotification(notification: Notification) {
        dataArray = notification.object as! [Quote]
        tableView!.reloadData()
    }
    
    override func viewDidLoad() {
        requestQuotes()
    }
    
    func requestQuotes() {
        NotificationCenter.default.post(name: .quotesRequestedNotification, object: nil)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quoteCell", for: indexPath) as! QuoteTableViewCell
        let quote = dataArray[indexPath.row]
        
        cell.symbol.text = quote.symbol
        print("Value symbol: \(quote.symbol)")
        cell.name.text = quote.name
        cell.rank.text = "\(quote.rank)"
        cell.price.text = "\(quote.price)"
        cell.price_date.text = "\(quote.priceDate)"
        cell.price_stamp.text = "\(quote.price_timestamp)"
        cell.market_cap.text = quote.market_cap
        cell.max_supply.text = quote.max_supply
        cell.circulating_supply.text = quote.circulating_supply
        if let url = URL(string: quote.logo_url) {cell.logo.load(url: url)}
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quote = dataArray[indexPath.row]
        NotificationCenter.default.post(name: .selectedQuoteRequestedNotification, object: quote)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if isSelectQuoteMode == true {
            self.dismiss(animated: true, completion: nil)
            return
        }
        if let destination = segue.destination as? DetailViewController,
            let cell = sender as? QuoteTableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
            let quote = dataArray[indexPath.row]
            destination.quote = quote
        }
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
