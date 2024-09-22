//
//  HomeView-ViewModel.swift
//  MoneyManager
//
//  Created by Gabriel on 09/07/23.
//

import Foundation

extension HomeView {
    @MainActor class ViewModel: ObservableObject {
        @Published var addCard = false
        
        var date = Date.now
        let todayDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE dd MMMM"
            return formatter
        }()
    }
}
