//
//  ConvertViewController.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/26/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import UIKit
import  SDWebImage

class ConvertViewController: UIViewController, UITextFieldDelegate {
    var fromQuote: Quote?
    var converter = Converter()
    var toQuote: Quote?
    var isToCurrencyButtonClicked = 0
    @IBOutlet weak var fromCurrencyTextfield: UITextField!
    @IBOutlet weak var selectToCurrencyButton: UIButton!
    @IBOutlet weak var selectFromCurrencyButton: UIButton!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self ,
                                               selector: #selector(receiveSelectedQuotesNotification),
                                               name: .selectedQuoteRequestedNotification,
                                               object: nil)
    }
    
    @objc func receiveSelectedQuotesNotification(notification: Notification) {
        if let receivedQuote = notification.object as? Quote {
            print("Selected quote:\(receivedQuote.name)")
            if isToCurrencyButtonClicked == 1 {
                fromQuote = receivedQuote
                if let fromQuote = fromQuote {
                    selectFromCurrencyButton.imageView!.sd_setImage(with: URL(string: fromQuote
                        .logo_url))
                    print("Logo url: \(fromQuote.logo_url)")
                    selectFromCurrencyButton.imageView!.sd_imageTransition = .flipFromTop
                }
            } else if isToCurrencyButtonClicked == 2 {
                toQuote = receivedQuote
                if let toQuote = toQuote {
                    selectFromCurrencyButton.imageView?.sd_setImage(with: URL(string: toQuote
                        .logo_url))
                    selectToCurrencyButton.imageView?.sd_imageIndicator = SDWebImageActivityIndicator.gray

                    selectFromCurrencyButton.imageView?.sd_imageTransition = .flipFromTop
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromCurrencyTextfield.delegate = self
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        fromCurrencyTextfield.endEditing(true)
        if let value = fromCurrencyTextfield.text {
            let amount = Double(value)!
            if fromQuote != nil, toQuote != nil {
                let currencyRate = converter.convert(baseQuote: fromQuote!, convertQuote: toQuote!, amount: amount)
                toCurrencyLabel.text = String(format: "%.2f", currencyRate)
            }
        }
    }
    
    @IBAction func selectFromCurrencyButtonPressed(_ sender: UIButton) {
        isToCurrencyButtonClicked = 1
    }
    
    @IBAction func selectToCurrencyButtonPressed(_ sender: UIButton) {
        isToCurrencyButtonClicked = 2
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuotesTableViewController {
            destination.isSelectQuoteMode = true
        }
    }
}
