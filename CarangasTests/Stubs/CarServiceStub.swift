//
//  CarServiceStub.swift
//  CarangasTests
//
//  Created by Matheus Lopes on 10/12/22.
//

import Foundation
@testable import Carangas

final class CarServiceStub: CarServiceProtocol {
    func loadCars(onComplete: @escaping (Result<[Car], CarServiceError>) -> Void) {
        let car1 = Car()
        car1._id = UUID().uuidString
        car1.brand = "Ford"
        car1.name = "Ka"
        car1.gasType = 2
        car1.price = 50000
        
        let car2 = Car()
        car2._id = UUID().uuidString
        car2.brand = "VW"
        car2.name = "Up"
        car2.gasType = 1
        car2.price = 40000
        
        let cars: [Car] = [car1, car2]
        
        onComplete(.success(cars))
    }
    
    func deleteCar(_ car: Car, onComplete: @escaping (Result<Void, CarServiceError>) -> Void) {
        
    }
    
    
}
