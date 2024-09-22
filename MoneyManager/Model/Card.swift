//
//  Card.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import Foundation

struct Card: Identifiable, Codable {
    var id = UUID()
    let cardNumber: String
    var balance: Double
    var transactions: [Transaction] = []
    var oldSavedTransactions: [Transaction] = []
    
    var computedBalance: Double {
        var balance = balance
        for transaction in transactions + oldSavedTransactions {
            if transaction.type == "credit" {
                balance += transaction.amount
            } else {
                balance -= transaction.amount
            }
        }
        return balance
    }
    
    var maskedCardNumber: String {
        let start = cardNumber.index(cardNumber.startIndex, offsetBy: 4)
        let end = cardNumber.endIndex
        let maskedNumber = "**** " + cardNumber[start..<end]
        return maskedNumber
    }
    
    var formattedBalance: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        formatter.minimumFractionDigits = 2
        let formattedValue = formatter.string(from: NSNumber(value: computedBalance)) ?? ""
        return formattedValue
    }
    
    static let emptyCard = Card(cardNumber: "", balance: 0.0, transactions: [], oldSavedTransactions: [])
}
