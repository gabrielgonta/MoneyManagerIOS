//
//  CardList-ViewModel.swift
//  MoneyManager
//
//  Created by Gabriel on 09/07/23.
//

import Foundation

extension CardList {
    @MainActor class ViewModel: ObservableObject {
        @Published var cardNumber = ""
        @Published var cardBalance = ""
        @Published var addCard = false
        @Published var currentCardIndex = 0
        
        let currency = Locale.current.currencySymbol ?? "$"
        let transactionDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            return formatter
        }()
    }
}
