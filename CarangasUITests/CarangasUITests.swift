//
//  CarangasUITests.swift
//  CarangasUITests
//
//  Created by Matheus Lopes on 10/12/22.
//

import XCTest
@testable import Carangas

class CarangasUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_navigationToCardVisualization() {
        let app = XCUIApplication()
        app.launch()
        
        let cell = app.tables["carsListTable"].cells.firstMatch
        XCTAssertTrue(cell.waitForExistence(timeout: 3.0))
        
        let cellTitleLabelText = cell.staticTexts["carCellTitle"].label
        
        cell.tap()
        
        XCTAssertTrue(app.navigationBars[cellTitleLabelText].exists, "Tela errada")
        
    }
}
