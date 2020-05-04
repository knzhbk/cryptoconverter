//
//  ConvertViewController.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 4/26/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import UIKit

class ConvertViewController: UIViewController, UITextFieldDelegate {
    var quote: Quote?
    
    @IBOutlet weak var fromCurrencyTextfield: UITextField!
    @IBOutlet weak var selectToCurrencyButton: UIButton!
    @IBOutlet weak var selectFromCurrencyButton: UIButton!
    @IBOutlet weak var toCurrencyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromCurrencyTextfield.delegate = self
        
    }
    
    @IBAction func convertButton(_ sender: UIButton) {
        fromCurrencyTextfield.endEditing(true)
        if let value = fromCurrencyTextfield.text {
            print(value)
          
        }
    }
    
    @IBAction func selectCurrency(_ sender: UIButton) {
        fromCurrencyTextfield.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
            
        }
    }
}
