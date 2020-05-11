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
    @IBOutlet weak var fromCurrencyImageView: UIImageView!
        @IBOutlet weak var toCurrencyImageView: UIImageView!
    var isToCurrencyButtonClicked = 0
    @IBOutlet weak var fromCurrencyTextfield: UITextField!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self ,
                                               selector: #selector(receiveSelectedQuotesNotification),
                                               name: .selectedQuoteSentNotification,
                                               object: nil)
    }
    
    @objc func receiveSelectedQuotesNotification(notification: Notification) {
        if let receivedQuote = notification.object as? Quote {
            print("Selected quote:\(receivedQuote.name)")
            if isToCurrencyButtonClicked == 1 {
                fromQuote = receivedQuote
                if let fromQuote = fromQuote {
                    fromCurrencyImageView.sd_setImage(with: URL(string: fromQuote
                        .logo_url))
                    fromCurrencyImageView.sd_imageTransition = .flipFromTop
                }
            } else if isToCurrencyButtonClicked == 2 {
                toQuote = receivedQuote
                if let toQuote = toQuote {
                    toCurrencyImageView.sd_setImage(with: URL(string: toQuote
                        .logo_url))
                    toCurrencyImageView.sd_imageTransition = .flipFromTop
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromCurrencyTextfield.delegate = self
        fromCurrencyTextfield.placeholder = "Enter amount"
        self.title = "Converter"
        
        let fromCurrencyTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(fromCurrencyImageViewTapped(tapGestureRecognizer:)))
        fromCurrencyImageView.isUserInteractionEnabled = true
        fromCurrencyImageView.addGestureRecognizer(fromCurrencyTapGestureRecognizer)
        
        let toCurrencyTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(toCurrencyImageViewTapped(tapGestureRecognizer:)))
        toCurrencyImageView.isUserInteractionEnabled = true
        toCurrencyImageView.addGestureRecognizer(toCurrencyTapGestureRecognizer)
        
        fromCurrencyTextfield.addTarget(self, action: #selector(convertQuote), for: .editingChanged)
    }
    
    @objc func fromCurrencyImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "QuotesTableViewController") as! QuotesTableViewController
        vc.isSelectQuoteMode = true
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated:true, completion: nil)
        isToCurrencyButtonClicked = 1
    }
    
    @objc func toCurrencyImageViewTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "QuotesTableViewController") as! QuotesTableViewController
        vc.isSelectQuoteMode = true
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated:true, completion: nil)
        isToCurrencyButtonClicked = 2
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        convertQuote()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
      let allowedCharacters = CharacterSet.decimalDigits
      let characterSet = CharacterSet(charactersIn: string)
      return allowedCharacters.isSuperset(of: characterSet)
    }
    
    @objc func convertQuote() {
        if fromCurrencyTextfield.text != "" {
            if let value = fromCurrencyTextfield.text {
                let amount = Double(value)!
                if fromQuote != nil, toQuote != nil {
                    let currencyRate = converter.convert(baseQuote: fromQuote!, convertQuote: toQuote!, amount: amount)
                    toCurrencyLabel.text = String(format: "%.2f", currencyRate)
                }
            }
        } else {
            fromCurrencyTextfield.endEditing(true)
            fromCurrencyTextfield.placeholder = "Enter amount"
        }
    }
}
