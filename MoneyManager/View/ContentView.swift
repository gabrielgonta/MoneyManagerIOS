//
//  ContentView.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isFirstUsage") var isFirstUsage = true
    @StateObject var dataController = DataController()
    
    var body: some View {
        Group {
            if isFirstUsage == false {
                HomeView()
            } else {
                WelcomeView(isFirstUsage: $isFirstUsage)
            }
        }
        .environmentObject(dataController)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
