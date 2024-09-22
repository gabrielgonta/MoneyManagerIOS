//
//  TextFieldViewModifier.swift
//  MoneyManager
//
//  Created by Nigel Gee on 20/07/2023.
//

import SwiftUI

struct TextFieldViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.roundedBorder)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(LinearGradient.borderGradient, lineWidth: 1)
            }
    }
}
