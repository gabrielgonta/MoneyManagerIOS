//
//  WelcomeDesign.swift
//  MoneyManager
//
//  Created by Gabriel on 02/07/23.
//

import SwiftUI

struct WelcomeDesign: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.midY / 1.2))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}
