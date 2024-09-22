//
//  DataController.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import SwiftUI

class DataController: ObservableObject {
    @Published var userData: UserData
    
    let saveURL = URL.documentsDirectory.appending(path: "userdata.json")
    
    init() {
        if let data = try? Data(contentsOf: saveURL) {
            if let decoded = try? JSONDecoder().decode(UserData.self, from: data) {
                self.userData = decoded
                return
            }
        }
        self.userData = .example
    }

    private func save() {
        if let data = try? JSONEncoder().encode(userData) {
            try? data.write(to: saveURL, options: [.atomic, .completeFileProtection])
        }
    }
    
    func finishFirstSetup(_ firstName: String, _ lastName: String) {
        userData.user.name = firstName
        userData.user.lastName = lastName
        save()
    }
    
    func saveUserInfo() {
        save()
    }
    
    func addCard(_ cardNumber: String, _ balance: String) {
        withAnimation {
            userData.cards.append(Card(cardNumber: cardNumber, balance: Double(balance) ?? 0.0))
        }
        save()
    }
    
    func addTransaction(at index: Int, _ transactionName: String, _ transactionType: String, _ transactionCategory: String, _ transactionAmount: String) {
        let newTransaction = Transaction(name: transactionName, type: transactionType, icon: transactionCategory, amount: Double(transactionAmount) ?? 0.0, time: Date.now)
        withAnimation {
            userData.cards[index].transactions.append(newTransaction)
        }
        save()
    }
    
    func deleteTransaction(at offsets: IndexSet, permanentCancellation: Bool, currentCardIndex: Int) {
        if permanentCancellation == false {
            for index in offsets {
                let transaction = userData.cards[currentCardIndex].transactions[index]
                userData.cards[currentCardIndex].oldSavedTransactions.append(transaction)
            }
        }
        withAnimation {
            userData.cards[currentCardIndex].transactions.remove(atOffsets: offsets)
        }
        save()
    }
}
