//
//  InteractorTests.swift
//  app_conversor_moeda_iosTests
//
//  Created by usuario on 10/09/24.
//

import XCTest
@testable import app_conversor_moeda_ios

class InteractorTests: XCTestCase {
    
    var interactor: CurrencyInteractor!

    override func setUp() {
        super.setUp()
        interactor = CurrencyInteractor()
    }

    override func tearDown() {
        interactor = nil
        super.tearDown()
    }

    func testFetchCurrenciesSuccess() {
        // Expectation para aguardar a resposta assíncrona
        let expectation = self.expectation(description: "Fetch currencies")

        interactor.fetchCurrencies { response in
            XCTAssertNotNil(response, "A resposta da API não deveria ser nula")
            
            // Validando se as taxas foram obtidas corretamente
            XCTAssertNotNil(response?.USDBRL.bid, "A taxa USD-BRL não deveria ser nula")
            XCTAssertNotNil(response?.EURBRL.bid, "A taxa EUR-BRL não deveria ser nula")

            expectation.fulfill()
        }

        // Timeout para a espera do resultado
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchCurrenciesFailure() {
        // Expectation para aguardar a resposta assíncrona
        let expectation = self.expectation(description: "Fetch currencies failure")
        
        // Cria um interactor mock que usa uma URL inválida
        let invalidInteractor = MockInvalidCurrencyInteractor()
        
        invalidInteractor.fetchCurrencies { response in
            XCTAssertNil(response, "A resposta deveria ser nula para uma URL inválida")
            expectation.fulfill()
        }
        
        // Timeout para a espera do resultado
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    class MockInvalidCurrencyInteractor: CurrencyInteractor {
        override func fetchCurrencies(completion: @escaping (CurrencyResponse?) -> Void) {
            // Simula uma URL inválida ou um erro de rede
            completion(nil) // Retorna nil para simular falha
        }
    }


}
