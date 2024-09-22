//
//  Extension-View.swift
//  MoneyManager
//
//  Created by Nigel Gee on 20/07/2023.
//

import SwiftUI

extension View {
    /// A modifier that give a gradient color border to a `TextField`.
    ///
    /// When applied it will change the border to a linear gradient from bottomTrailing to topLeading
    /// of [.pink, .purple, .black] or [.pink, .purple, .white] depending on light/dark mode.
    var textFieldViewModifier: some View {
        self.modifier(TextFieldViewModifier())
    }

    /// A modifier that give a gradient color `RoundedRectangle` to a `Button`
    ///
    /// When applied it will change the border to a linear gradient from bottomTrailing to topLeading
    /// of [.pink, .purple, .black] or [.pink, .purple, .white] depending on light/dark mode.
    var buttonViewModifier: some View {
        self.modifier(ButtonViewModifier())
    }
}
