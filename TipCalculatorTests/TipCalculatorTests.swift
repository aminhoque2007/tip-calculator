//
//  TipCalculatorTests.swift
//  TipCalculatorTests
//
//  Created by Amin Hoque on 10/7/23.
//

import XCTest

class when_calculating_tip_based_on_total_amount: XCTestCase {

  func test_should_calculate_tip_successfully() {

    let calculator = TipCalculator()
    let tip = try! calculator.calculate(total: 100, tipPercentage: 0.1)
    XCTAssertEqual(10, tip)
  }

}

class when_calculating_tip_based_on_negative_total_amount: XCTestCase {
  
  func test_should_throw_invalid_input_exception() {
    
    let calculator = TipCalculator()
    
    XCTAssertThrowsError(try calculator.calculate(total: -100, tipPercentage: 0.1)) { error in
      XCTAssertEqual(error as! TipCalculatorError, TipCalculatorError.invalidInput)
    }
    
  }
  
}
