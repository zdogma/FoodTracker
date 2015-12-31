//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Tomohiro Zoda on 2015/12/29.
//  Copyright (c) 2015年 Tomohiro Zoda. All rights reserved.
//

import UIKit
import XCTest

class FoodTrackerTests: XCTestCase {
    
    // MARK: FoodTracker Tests
    func testMealIntialization() {
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem, "Success")
        
        let noName = Meal(name: "", photo: nil, rating: 5)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let negativeRating = Meal(name: "Negative rating", photo: nil, rating: -1)
        XCTAssertNil(negativeRating, "NegativeRatings are invalid, be positive")
    }
    
}
