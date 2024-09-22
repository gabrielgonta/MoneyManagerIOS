//
//  AddCardView-ViewModel.swift
//  MoneyManager
//
//  Created by Gabriel on 09/07/23.
//

import Foundation

extension AddCardView {
    @MainActor class ViewModel: ObservableObject {
        @Published var cardNumber = ""
        @Published var maskedCardNumber = ""
        @Published var errorMessage = ""
        @Published var balance = ""

        var isDisabled: Bool {
            cardNumber.isEmpty && balance.isEmpty
        }
        
        func maskCardNumber(dataController: DataController) {
            if cardNumber.count == 8 {
                let start = cardNumber.index(cardNumber.startIndex, offsetBy: 4)
                let end = cardNumber.endIndex
                maskedCardNumber = "****" + cardNumber[start..<end]
                errorMessage = ""
                dataController.addCard(cardNumber, balance)
                cardNumber = ""
                balance = ""
            } else {
                errorMessage = "Card number must be exactly 8 numbers long"
            }
        }
    }
}
