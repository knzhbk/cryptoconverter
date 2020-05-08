//
//  Notifications.swift
//  CryptoConverter
//
//  Created by Adina Kenzhebekova on 5/5/20.
//  Copyright © 2020 Adina Kenzhebekova. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let quotesSentNotification = NSNotification.Name("quotes_sent")
    static let quotesRequestedNotification = NSNotification.Name("quotes_requested")
    static let selectedQuoteSentNotification = NSNotification.Name("selected_quote_sent")
}
