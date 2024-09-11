//
//  PresenterTests.swift .swift
//  app_conversor_moeda_iosTests
//
//  Created by usuario on 10/09/24.
//

import XCTest
@testable import app_conversor_moeda_ios

class PresenterTests: XCTestCase {

    var presenter: CurrencyPresenter!
    
    override func setUp() {
        super.setUp()
        presenter = CurrencyPresenter()
    }

    override func tearDown() {
        presenter = nil
        super.tearDown()
    }

    func testConvertCurrency() {
        // Simulando valor inserido
        presenter.realValue = "100"
        
        // Mockando a resposta do Interactor
        let mockInteractor = MockInteractor()
        presenter.convertCurrency() // Chama o método para a conversão

        // Verifica se o valor foi corretamente convertido
        XCTAssertEqual(presenter.usdValue, "...", "Valor de USD deveria ser convertido")
        XCTAssertEqual(presenter.eurValue, "...", "Valor de EUR deveria ser convertido")
    }
}

// Mock Interactor para testar o presenter
class MockInteractor: CurrencyInteractor {
    override func fetchCurrencies(completion: @escaping (CurrencyResponse?) -> Void) {
        // Retorna uma resposta mockada
        let mockResponse = CurrencyResponse(
            USDBRL: CurrencyResponse.CurrencyRate(bid: "5.0"),
            EURBRL: CurrencyResponse.CurrencyRate(bid: "6.0")
        )
        completion(mockResponse)
    }
}
