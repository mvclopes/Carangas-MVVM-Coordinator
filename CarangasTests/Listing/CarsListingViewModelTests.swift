//
//  CarsListingViewModelTests.swift
//  CarangasTests
//
//  Created by Matheus Lopes on 10/12/22.
//

import XCTest
@testable import Carangas

class CarsListingViewModelTests: XCTestCase {

    // PADRÃO DE NOMENCLATURA DE TESTE
    // test_oQueEstaSendoTestado_condicoesIniciais_oQueEuEsperoQueAconteca
    
    func test_numberOfRows_shouldReturnNumberOfCarsFromService() {
        // Given
        let sut = makeSUT()
        
        // When
        sut.loadCars { _ in }
        let result = sut.numberOfRows
        
        // Then
        XCTAssertEqual(result, 2, "O número de carros não foi o esperado")
    }
    
    func test_cellViewModelFor_shouldReturnCarCellViewModelForCarAtIndexPath() {
        // Given
        let sut = makeSUT()
        sut.loadCars { _ in }
        let indexPath = IndexPath(row: 0, section: 0)
        
        // When
        let cellViewModel = sut.cellViewModelFor(indexPath)
        
        // Then
        XCTAssertTrue(cellViewModel is CarCellViewModel)
    }
    
    // MARK: - Helpers
    func makeSUT() -> CarsListingViewModel {
        // SUT -> System Under Test
        let navigationController = UINavigationController()
        let coordinator = CarsListingCoordinator(navigationController: navigationController)
        let service = CarServiceStub()
        let sut = CarsListingViewModel(service: service, coordinator: coordinator)
        return sut
    }
}
