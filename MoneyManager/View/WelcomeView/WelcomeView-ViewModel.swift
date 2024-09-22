//
//  WelcomeView-ViewModel.swift
//  MoneyManager
//
//  Created by Gabriel on 09/07/23.
//

import Foundation

extension WelcomeView {
    @MainActor class ViewModel: ObservableObject {
        @Published var firstName = ""
        @Published var lastName = ""
        @Published var showInformation = false
        @Published var isPresentingHomeView = false
    }
}
