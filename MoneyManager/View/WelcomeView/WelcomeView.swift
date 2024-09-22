//
//  WelcomeView.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var dataController: DataController
    @StateObject private var viewModel = ViewModel()
    @Binding var isFirstUsage: Bool
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                WelcomeDesign()
                    .fill(colorScheme == .light ? Color.pink : Color.purple)
                ZStack {
                    VStack {
                        Text("Welcome")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .foregroundStyle(.primary)
                            .bold()
                            .padding(.bottom)
                        if viewModel.showInformation {
                            Group {
                                TextField("Name", text: $viewModel.firstName)
                                TextField("Last Name", text: $viewModel.lastName)
                            }
                            .textFieldViewModifier
//                            .textFieldStyle(.roundedBorder)
//                            .border(LinearGradient.gradient(for: colorScheme))
                            .padding()
                        }
                    }
                    
                    if !viewModel.firstName.isEmpty && !viewModel.lastName.isEmpty {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Button {
                                    dataController.finishFirstSetup(viewModel.firstName, viewModel.lastName)
                                    viewModel.isPresentingHomeView = true
                                    isFirstUsage = false
                                } label: {
                                    Text("Start")
                                        .padding()
                                        .background(colorScheme == .light ? Color.pink : Color.purple)
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .clipShape(Capsule())
                                        .padding(.trailing)
                                }
                                .accessibilityLabel("Go to the home view")
                                .accessibilityAddTraits(.isButton)
                                .padding(.bottom, 25)
                            }
                            .padding()
                        }
                        .padding()
                        .fullScreenCover(isPresented: $viewModel.isPresentingHomeView) {
                            HomeView()
                        }
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    withAnimation {
                        viewModel.showInformation = true
                    }
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView(isFirstUsage: .constant(true))
            .environmentObject(DataController())
    }
}
