//
//  CardList.swift
//  MoneyManager
//
//  Created by Gabriel on 03/07/23.
//

import SwiftUI

struct CardList: View {
    @EnvironmentObject var dataController: DataController
    @StateObject private var viewModel = ViewModel()
    @Binding var permanentCancellation: Bool
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            VStack {
                if !dataController.userData.cards.isEmpty {
                    TabView(selection: $viewModel.currentCardIndex) {
                        ForEach(dataController.userData.cards.indices, id: \.self) { index in
                            NavigationLink {
                                DetailView(permanentCancellation: $permanentCancellation, index: index)
                            } label: {
                                CardView(balance: dataController.userData.cards[index].formattedBalance, cardNumber: dataController.userData.cards[index].maskedCardNumber)
                            }
                        }
                    }
                    HStack {
                        Text("Transactions")
                            .font(.title.bold())
                            .padding()
                        Spacer()
                        NavigationLink {
                            AddTransactionView(index: viewModel.currentCardIndex)
                        } label: {
                            Image(systemName: "plus")
                        }
                        .font(.title)
                        .foregroundColor(!dataController.userData.cards.isEmpty ? colorScheme == .light ? .pink : .purple : nil)
                        .padding(.trailing)
                        .disabled(dataController.userData.cards.isEmpty)
                        .accessibilityAddTraits(.isButton)
                        .accessibilityLabel("Add a new transaction")
                    }
                    if dataController.userData.cards.indices.contains(viewModel.currentCardIndex) {
                        List {
                            if !dataController.userData.cards[viewModel.currentCardIndex].transactions.isEmpty {
                                ForEach(dataController.userData.cards[viewModel.currentCardIndex].transactions.reversed().prefix(5)) { transaction in
                                    HStack {
                                        Image(systemName: transaction.iconToDisplay)
                                        Spacer()
                                        VStack {
                                            Text(transaction.name)
                                                .font(.title3.bold())
                                                .frame(maxWidth: .infinity)
                                            Text(transaction.time, formatter: viewModel.transactionDateFormatter)
                                                .font(.footnote)
                                        }
                                        Spacer()
                                        Text(transaction.type == "credit" ? "+ \(viewModel.currency)\(transaction.formattedAmount)" : "- \(viewModel.currency )\(transaction.formattedAmount)")
                                            .font(.title2)
                                            .foregroundColor(transaction.type == "credit" ? .green : .red)
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                }
                                .onDelete { offsets in
                                    let transactions = dataController.userData.cards[viewModel.currentCardIndex].transactions
                                    let reversedOffsets = offsets.map { transactions.count - 1 - $0 }
                                    dataController.deleteTransaction(at: IndexSet(reversedOffsets), permanentCancellation: permanentCancellation, currentCardIndex: viewModel.currentCardIndex)
                                }
                            } else {
                                Text("Nothing to display. Add a transaction!")
                            }
                        }
                    }
                }
                else {
                    VStack {
                        AddCardButton(action: { viewModel.addCard = true })
                        Group {
                            Text("Add your ")
                            +
                            Text("First Card!")
                                .font(.title2)
                                .bold()
                        }
                        .padding(.top)
                    }
                    .accessibilityLabel("Add your first card!")
                }
                
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
            .frame(maxWidth: .infinity)
        }
        .sheet(isPresented: $viewModel.addCard) {
            AddCardView()
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardList(permanentCancellation: .constant(true))
            CardList(permanentCancellation: .constant(false))
                .preferredColorScheme(.dark)
        }
        .environmentObject(DataController())
    }
}
