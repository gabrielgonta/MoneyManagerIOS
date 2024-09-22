//
//  AddTransactionView-ViewModel.swift
//  MoneyManager
//
//  Created by Gabriel on 09/07/23.
//

import Foundation

extension AddTransactionView {
    @MainActor class ViewModel: ObservableObject {
        @Published var transactionName = ""
        @Published var transactionAmount = ""
        @Published var transactionCategory = "personal"
        @Published var transactionType = "debit"
        
        let debitCategories = ["personal", "business", "entertainment", "transport"]
        let creditCategories = ["income", "dividend", "donation"]
        let types = ["debit", "credit"]
    }
}
