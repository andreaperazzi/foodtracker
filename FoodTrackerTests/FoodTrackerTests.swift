//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Andrea Perazzi on 10/04/16.
//  Copyright © 2016 Andrea Perazzi. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided
    func testMealInitialization() {
        
        // Success case
        let potencialItem = Meal(name: "Newest Meal", photo: nil, rating: 5)
        XCTAssertNotNil(potencialItem)
        
        // Failure cases
        let noName = Meal(name: "", photo: nil, rating: 3)
        XCTAssertNil(noName, "Empty meal is invalid")
        
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating,  "Negative ratings are invalid, be positive")
        
        
    }
    
    
    
}
