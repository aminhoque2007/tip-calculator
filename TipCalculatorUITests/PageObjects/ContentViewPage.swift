//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Amin Hoque on 24/7/23.
//

import Foundation
import XCTest

class ContentViewPage {
  
  var app: XCUIApplication
  
  init(app: XCUIApplication) {
    self.app = app
  }
  
  var calculateTipButton: XCUIElement {
    app.buttons["calculateTipButton"]
  }
  
  var messageText: XCUIElement {
    app.staticTexts["messageText"]
  }

  var tipAmount: XCUIElement {
    app.staticTexts["tipAmount"]
  }

  var tipPercentageSegmentedControl: XCUIElement {
    app.segmentedControls["tipPercentageSegmentedControl"]
  }

  var totalTextField: XCUIElement {
    app.textFields["totalTextfield"]
  }  
}
