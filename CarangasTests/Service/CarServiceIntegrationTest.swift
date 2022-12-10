//
//  CarServiceIntegrationTest.swift
//  CarangasTests
//
//  Created by Matheus Lopes on 10/12/22.
//

import XCTest
@testable import Carangas

class CarServiceIntegrationTest: XCTestCase {
    
    func test_loadCars_shouldReturnSuccess() {
        let sut = makeSUT()
        
        // Utilizado para operações em threads assíncronas
        let expectation = expectation(description: "Success service!")
        sut.loadCars { result in
            switch result {
            case .failure:
                XCTFail("O serviço falhou")
            case .success(let cars):
                print("O serviço retornou lista com \(cars.count) itens")
                break
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    private func makeSUT() -> CarService {
        CarService()
    }

}
