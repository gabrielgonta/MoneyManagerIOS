//
//  Transaction.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import Foundation

struct Transaction: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let icon: String
    let amount: Double
    let time: Date
    
    var formattedAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.groupingSize = 3
        formatter.minimumFractionDigits = 2
        let formattedValue = formatter.string(from: NSNumber(value: amount)) ?? ""
        return formattedValue
    }
    
    var iconToDisplay: String {
        switch icon {
        case "personal":
            return "person"
        case "business":
            return "pc"
        case "income", "dividend", "donation":
            return "creditcard"
        case "entertainment":
            return "gamecontroller"
        case "transport":
            return "tram"
        default:
            return "person"
        }
    }
}
