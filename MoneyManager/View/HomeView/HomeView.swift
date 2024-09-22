//
//  HomeView.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataController: DataController
    @StateObject private var viewModel = ViewModel()
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("permanentCncellation") var permanentCancellation = false
    
    var body: some View {
        NavigationStack {
            CardList(permanentCancellation: $permanentCancellation)
                .navigationTitle("Money")
                .sheet(isPresented: $viewModel.addCard) {
                    AddCardView()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text(viewModel.todayDateFormatter.string(from: viewModel.date))
                            .bold()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.addCard = true 
                        } label: {
                            Image(systemName: "creditcard")
                                .foregroundColor(colorScheme == .light ? .pink : .purple)
                        }

                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            ProfileView(permanentCancellation: $permanentCancellation)
                        } label: {
                            Image(systemName: "person.circle")
                                .foregroundColor(colorScheme == .light ? .pink : .purple)
                        }
                        .accessibilityElement()
                        .accessibilityAddTraits(.isButton)
                        .accessibilityLabel("Go to your profile")
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
            HomeView()
                .preferredColorScheme(.dark)
        }
        .environmentObject(DataController())
    }
}
