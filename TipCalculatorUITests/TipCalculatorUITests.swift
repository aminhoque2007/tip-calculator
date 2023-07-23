//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Amin Hoque on 10/7/23.
//

import XCTest

final class when_content_view_is_launched: XCTestCase {
  
  private var app: XCUIApplication!
  private var contentViewPage: ContentViewPage!
  
  override func setUp() {
    app = XCUIApplication()
    contentViewPage = ContentViewPage(app: app)
    continueAfterFailure = false
    app.launch()
  }
  
  func test_should_make_sure_total_text_field_contains_default_value() {
    XCTAssertEqual(contentViewPage.totalTextField.value as! String, "Enter total")
  }
  
  func test_should_make_sure_default_button_is_selected() {
    
    let tipPercentage = contentViewPage.tipPercentageSegmentedControl
    let segmentedControlButton = tipPercentage.buttons.element(boundBy: 1)
    
    XCTAssertEqual(segmentedControlButton.label, "20%")
    XCTAssertTrue(segmentedControlButton.isSelected)
  }
}

/**
 This test suite requires some UI setup e.g. tapping the textfield and then tappnig the button
 */
class when_valid_input_is_provided: XCTestCase {
  
  // setup an instance of app so all tests can access it
  private var app: XCUIApplication!
  private var contentViewPage: ContentViewPage!
  
  override func setUp() {
    // assign a new app instance before each test runs
    app = XCUIApplication()
    contentViewPage = ContentViewPage(app: app)
    continueAfterFailure = false
    app.launch()
    
    // first tap the text field which activates the keyboard
    let totalTextfield = contentViewPage.totalTextField
    totalTextfield.tap()
    totalTextfield.typeText("100")
    
    // then find the "Calculate Tip" button/label and tap it
    contentViewPage.calculateTipButton.tap()
  }
  
  func test_should_make_sure_tip_is_displayed_correctly() {

    // use .staticTexts since it's not an interactive textField
    let tipAmount = contentViewPage.tipAmount
    // use .waitForExistence to make sure we give app enough time to show the text
    let _ = tipAmount.waitForExistence(timeout: 0.5) // seconds
    
    XCTAssertEqual(tipAmount.label, "$20.00")
  }
}

class when_invalid_input_is_provided: XCTestCase {
  
  // setup an instance of app so all tests can access it
  private var app: XCUIApplication!
  private var contentViewPage: ContentViewPage!
  
  override func setUp() {
    // assign a new app instance before each test runs
    app = XCUIApplication()
    contentViewPage = ContentViewPage(app: app)
    continueAfterFailure = false
    app.launch()
    
    // first tap the text field which activates the keyboard
    let totalTextfield = contentViewPage.totalTextField
    totalTextfield.tap()
    totalTextfield.typeText("-100")
    
    // then find the "Calculate Tip" button/label and tap it
    contentViewPage.calculateTipButton.tap()
  }
  
  func test_should_display_error_for_invalid_input() {
    
    let messageText = contentViewPage.messageText
    let _ = messageText.waitForExistence(timeout: 0.5)
    
    XCTAssertEqual(messageText.label, "Invalid Input")
  }
}
