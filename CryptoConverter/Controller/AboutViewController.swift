//
//  AboutViewController.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 5/7/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var linkTextView: UITextView!
    
    override func viewDidLoad() {
        let attributedString = NSMutableAttributedString(string: "Contact me at Telegram")
        attributedString.addAttribute(.link, value: "https://t.me/knzhbks", range: NSRange(location: 0, length: 22))
        linkTextView.font = .systemFont(ofSize: 18)
        linkTextView.attributedText = attributedString
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}
