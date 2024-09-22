//
//  CardView.swift
//  MoneyManager
//
//  Created by Gabriel on 03/07/23.
//

import SwiftUI

struct CardView: View {
    var balance: String
    let cardNumber: String
    let currency = Locale.current.currencySymbol ?? "$"
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Image(decorative: colorScheme == .light ? "Card-bg" : "Card-bg-light")
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
            VStack(alignment: .leading) {
                HStack {
                    Text(cardNumber)
                        .font(.title2)
                    
                    Spacer()
                    
                    Text("Bank")
                        .font(.title2.bold().italic())
                        .padding(.trailing)
                }
                .padding(.vertical)
                .padding(.leading)
                Spacer()
                Text("Balance")
                    .font(.subheadline)
                    .padding(.leading)
                Text("\(currency) \(balance)")
                    .font(.largeTitle)
                    .bold()
                    .padding(.leading)
                Spacer()
            }
            .foregroundColor(colorScheme == .light ? .white : .black)
            .padding()
            .accessibilityLabel("Press the card for displaying the relative transactions")
        }
        .frame(width: 300, height: 200)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(balance: "3500.99", cardNumber: "6543")
            CardView(balance: "3500.99", cardNumber: "6543")
                .preferredColorScheme(.dark)
        }
    }
}

