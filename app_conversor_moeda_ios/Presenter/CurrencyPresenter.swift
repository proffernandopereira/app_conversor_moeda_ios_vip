//
//  CurrencyPresenter.swift
//  app_conversor_moeda_ios
//
//  Created by usuario on 10/09/24.
//

import Foundation
import Combine

class CurrencyPresenter: ObservableObject {
    @Published var realValue: String = ""
    @Published var usdValue: String = "..."
    @Published var eurValue: String = "..."

    private let interactor = CurrencyInteractor()

    func convertCurrency() {
        guard let realAmount = Double(realValue) else {
            print("Valor informado inválido")
            return
        }

        interactor.fetchCurrencies { [weak self] response in
            guard let response = response else {
                print("Falha ao buscar dados de moeda")
                return
            }

            DispatchQueue.main.async {
                let usdRate = Double(response.USDBRL.bid) ?? 0.0
                let eurRate = Double(response.EURBRL.bid) ?? 0.0

                self?.usdValue = String(format: "%.2f", realAmount * usdRate)
                self?.eurValue = String(format: "%.2f", realAmount * eurRate)
            }
        }
    }
}
