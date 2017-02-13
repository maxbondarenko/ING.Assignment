//
//  ING_AssignmentUITests.swift
//  ING.AssignmentUITests
//
//  Created by Max Bondarenko on 2/10/17.
//  Copyright © 2017 MBKO. All rights reserved.
//

import XCTest

class ING_AssignmentUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testClickOnTheEyeButtonShouldChangeTheCaptionToDone() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCUIApplication().navigationBars["Accounts"].children(matching: .button).element.tap()
        let buttonTitle = XCUIApplication().navigationBars["Accounts"].children(matching: .button).element.label
        XCTAssert(buttonTitle == "Done")
    }
    
    
    func testAddHiddenAccountShouldShowThreeCells() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let app = XCUIApplication()
        app.navigationBars["Accounts"].children(matching: .button).element.tap()
        app.tables.cells.containing(.staticText, identifier:",").children(matching: .button).element.tap()
        
        app.navigationBars["Accounts"].children(matching: .button).element.tap()
        
        XCTAssert(app.tables.cells.count == 3)
        
    
    }
    
    func testRemoveAccountShouldShowOneCell() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        app.navigationBars["Accounts"].children(matching: .button).element.tap()
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).children(matching: .button).element.tap()
     
        
        app.navigationBars["Accounts"].children(matching: .button).element.tap()
        
        XCTAssert(app.tables.cells.count == 1)
       
        
    }

 
    
    func testShouldLoadTwoCells() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let app = XCUIApplication()
        XCTAssert(app.tables.cells.count == 2)
    }

    
}
