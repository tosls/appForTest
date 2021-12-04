//
//  appForTestTests.swift
//  appForTestTests
//
//  Created by Антон Бобрышев on 04.12.2021.
//

import XCTest
@testable import appForTest

class appForTestTests: XCTestCase {
    
    var fieldValidator: FieldValidator!
    
    override func setUpWithError() throws {
        // инициализируем перед тестами
        
        fieldValidator = FieldValidatorImpl()
    }

    override func tearDownWithError() throws {
        // уничтожаем после тестов
        
        fieldValidator = nil
    }

    func testValidatorCorrectWithEmptyValues() throws {
        // Given
        let loginTF = UITextField()
        let paswwordTF = UITextField()
        let expectedResult = false
        var validateResult: Bool
        
        // When
        validateResult = fieldValidator.validateLoginsTextFields(loginTF: loginTF, passwordTF: paswwordTF)
        
        // Then
        XCTAssertEqual(expectedResult, validateResult)
    }
    
    func testAsyncValidatorCorrectWithEmptyValues() throws {
        // Given
        let loginTF = UITextField()
        let paswwordTF = UITextField()
        let expectedResult = false
        let validatorExpectation = expectation(description: "Expectation in " + #function)
        var validateResult: Bool?
        
        // When
        fieldValidator.asyncValidateLoginsTextFields(loginTF: loginTF,
                                                     passwordTF: paswwordTF) { (isValid) in
            validateResult = isValid
            
            validatorExpectation.fulfill()
        }
        
        // Then
        
        waitForExpectations(timeout: 2.0) { (error) in
            if error != nil {
                XCTFail()
            }
            XCTAssertEqual(expectedResult, validateResult)
        }
    }

    func testPerformanceExample() throws {
        measure {
            // Скорость теста
        }
    }
}
