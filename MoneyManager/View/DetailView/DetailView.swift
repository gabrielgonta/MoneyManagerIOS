//
//  DetailView.swift
//  MoneyManager
//
//  Created by Gabriel on 05/07/23.
//

import SwiftUI
import Charts

struct DetailView: View {
    @EnvironmentObject var dataController: DataController
    @StateObject var viewModel = ViewModel()
    @Binding var permanentCancellation: Bool
    var index: Int
    
    var body: some View {
        VStack {
            if dataController.userData.cards.indices.contains(index) {
                if !dataController.userData.cards[index].transactions.isEmpty || !dataController.userData.cards[index].oldSavedTransactions.isEmpty {
                    Chart {
                        ForEach(dataController.userData.cards[index].transactions + dataController.userData.cards[index].oldSavedTransactions) { data in
                            BarMark(x: .value("Type", data.type), y: .value("Amount", data.amount))
                        }
                        
                    }
                    .padding()
                } else {
                    Text("It will appear a cool chart when a transaction is added!")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                List {
                    if !dataController.userData.cards[index].transactions.isEmpty {
                        ForEach(dataController.userData.cards[index].transactions.reversed()) { transaction in
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
                            let transactions = dataController.userData.cards[index].transactions
                            let reversedOffsets = offsets.map { transactions.count - 1 - $0 }
                            dataController.deleteTransaction(at: IndexSet(reversedOffsets), permanentCancellation: permanentCancellation, currentCardIndex: index)
                        }
                    } else {
                        Text("Nothing to display. Add a transaction!")
                    }
                }
                
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                DetailView(permanentCancellation: .constant(true), index: 0)
            }
            DetailView(permanentCancellation: .constant(false), index: 0)
                .preferredColorScheme(.dark)
        }
        .environmentObject(DataController())
    }
}
