//
//  Extension-LinearGradient.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import SwiftUI

extension LinearGradient {
    static func gradient(for colorScheme: ColorScheme) -> LinearGradient {
        if colorScheme == .light {
            return LinearGradient(colors: [.pink, .purple, .black], startPoint: .bottomTrailing, endPoint: .topLeading)
        } else if colorScheme == .dark {
            return LinearGradient(colors: [.pink, .purple, .white], startPoint: .bottomTrailing, endPoint: .topLeading)
        }
        return LinearGradient(colors: [.pink, .purple, .black], startPoint: .bottomTrailing, endPoint: .topLeading)
    }

    static var borderGradient: LinearGradient {
        LinearGradient(colors: [.pink, .purple, .primary], startPoint: .bottomTrailing, endPoint: .topLeading)
    }
}
