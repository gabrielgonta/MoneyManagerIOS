//
//  AddTransactionView.swift
//  MoneyManager
//
//  Created by Gabriel on 03/07/23.
//

import SwiftUI

struct AddTransactionView: View {
    @EnvironmentObject var dataController: DataController
    @StateObject private var viewModel = ViewModel()
    var index: Int
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Insert name", text: $viewModel.transactionName)
            } header: {
                Text("Transaction Name")
            }
            Section {
                TextField("Insert amoun", text: $viewModel.transactionAmount)
                    .keyboardType(.decimalPad)
            } header: {
                Text("Transaction Amount")
            }
            Section {
                Picker("Choose type", selection: $viewModel.transactionType) {
                    ForEach(viewModel.types, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Transaction Category")
            }
            Section {
                Picker("Choose a category", selection: $viewModel.transactionCategory) {
                    ForEach(viewModel.transactionType == "debit" ? viewModel.debitCategories : viewModel.creditCategories, id: \.self) {
                        Text($0)
                    }
                }
            } header: {
                Text("Transaction Category")
            }
            Section {
                Text("To view all the transactions, tap the desired card in the home view.")
                    .foregroundColor(.secondary)
            }
        }
        .navigationTitle("New Transaction")
        .toolbar {
            Button {
                dataController.addTransaction(at: index, viewModel.transactionName, viewModel.transactionType, viewModel.transactionCategory, viewModel.transactionAmount)
                dismiss()
            } label: {
                Text("Add")
            }
            .disabled(viewModel.transactionName.trimmingCharacters(in: .whitespaces) == "" || viewModel.transactionAmount == "")
        }
    }
}

struct AddTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                AddTransactionView(index: 0)
            }
            AddTransactionView(index: 0)
                .preferredColorScheme(.dark)
        }
    }
}
