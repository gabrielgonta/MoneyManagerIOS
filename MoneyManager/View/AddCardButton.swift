//
//  AddCardButton.swift
//  MoneyManager
//
//  Created by Gabriel on 03/07/23.
//

import SwiftUI

struct AddCardButton: View {
    @Environment(\.colorScheme) var colorScheme
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
        }
        .padding()
        .background(LinearGradient.gradient(for: colorScheme))
        .foregroundColor(.white)
        .font(.title2)
        .clipShape(Capsule())
    }
}

