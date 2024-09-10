//
//  ContentView.swift
//  app_conversor_moeda_ios
//
//  Created by usuario on 10/09/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var presenter = CurrencyPresenter()
    var body: some View {
        VStack(spacing: 16) {
            TextField("Valor em BRL", text: $presenter.realValue)
                .keyboardType(.decimalPad)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .padding(.horizontal, 10)

            Button("Converter") {
                presenter.convertCurrency()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding(.horizontal, 10)

            VStack(alignment: .leading, spacing: 8) {
                Text("Valor em USD")
                    .padding(.horizontal, 10)
                Text(presenter.usdValue)
                    .padding(.horizontal, 10)

                Text("Valor em EUR")
                    .padding(.horizontal, 10)
                Text(presenter.eurValue)
                    .padding(.horizontal, 10)
            }
        }
        .padding()
    }
}

struct CurrencyConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
