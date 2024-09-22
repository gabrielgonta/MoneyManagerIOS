//
//  ButtonViewModifier.swift
//  MoneyManager
//
//  Created by Nigel Gee on 20/07/2023.
//

import SwiftUI

struct ButtonViewModifier: ViewModifier {    
    func body(content: Content) -> some View {
        content
            .padding()
            .padding(.horizontal)
            .foregroundStyle(Color.primary)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(LinearGradient.borderGradient, lineWidth: 2)
            }
    }
}
