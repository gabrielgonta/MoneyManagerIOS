//
//  AddCardView.swift
//  MoneyManager
//
//  Created by Gabriel on 03/07/23.
//

import SwiftUI

struct AddCardView: View {
    @EnvironmentObject var dataController: DataController
    @StateObject private var viewModel = ViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                SecureField("Enter card number", text: $viewModel.cardNumber)
                    .keyboardType(.numberPad)
                    .textFieldViewModifier

                TextField("Enter balance", text: $viewModel.balance)
                    .keyboardType(.decimalPad)
                    .textFieldViewModifier

                Button {
                    viewModel.maskCardNumber(dataController: dataController)
                    if viewModel.errorMessage.isEmpty {
                        dismiss()
                    }
                } label: {
                    Text("Submit")
                        .buttonViewModifier
                }
                .disabled(viewModel.isDisabled)
                .padding(.top)
                .accessibilityHint("this will add the new card")
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding(.vertical)
                }
            }
            .padding()
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Label("Close", systemImage: "xmark.circle")
                        .symbolRenderingMode(.multicolor)
                }

            }
            .navigationTitle("Add Card")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddCardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AddCardView()
            AddCardView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(DataController())
    }
}
