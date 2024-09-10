//
//  CurrencyResponse.swift
//  app_conversor_moeda_ios
//
//  Created by usuario on 10/09/24.
//

import Foundation

struct CurrencyResponse: Codable {
    let USDBRL: CurrencyRate
    let EURBRL: CurrencyRate

    struct CurrencyRate: Codable {
        let bid: String
    }
}
