//
//  CurrencySelectionTableViewController.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/26/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import UIKit

class CurrencySelectionTableViewController: UITableViewController {
    var quoteProvider: QuoteProvider?
    var dataArray: [Quote] = []
    
    override func viewDidLoad() {
        quoteProvider = QuoteProvider()
        dataArray = quoteProvider!.createQuoteArray()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as! CurrencyTableViewCell
        let quote = dataArray[indexPath.row]
        
        cell.currencyLabel.text = quote.name
        if let url = URL(string: quote.logo_url) {cell.currencyImage.load(url: url)}
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConvertViewController,
            let cell = sender as? CurrencyTableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
            let quote = dataArray[indexPath.row]
            destination.quote = quote
        }
    }
}
