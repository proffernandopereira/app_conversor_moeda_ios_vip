//
//  CurrencyInteractor.swift
//  app_conversor_moeda_ios
//
//  Created by usuario on 10/09/24.
//

import Foundation

class CurrencyInteractor {
    func fetchCurrencies(completion: @escaping (CurrencyResponse?) -> Void) {
        let urlString = "https://economia.awesomeapi.com.br/last/USD-BRL,EUR-BRL"
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            do {
                let result = try JSONDecoder().decode(CurrencyResponse.self, from: data)
                completion(result)
            } catch {
                print("Error decoding response: \(error)")
                completion(nil)
            }
        }
        task.resume()
    }
}
