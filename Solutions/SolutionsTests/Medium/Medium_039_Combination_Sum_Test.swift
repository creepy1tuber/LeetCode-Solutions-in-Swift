//
//  Medium_039_Combination_Sum_Test.swift
//  Solutions
//
//  Created by Di Wu on 5/17/15.
//  Copyright (c) 2015 diwu. All rights reserved.
//

import XCTest

class Medium_039_Combination_Sum_Test: XCTestCase {
    private static let ProblemName: String = "Medium_039_Combination_Sum"
    private static let TimeOutName = ProblemName + Default_Timeout_Suffix
    private static let TimeOut = Default_Timeout_Value
    func test_001() {
        let input: [Any] = [[2, 3, 6, 7], 7]
        let expected: [[Int]] = [[7], [2, 2, 3]]
        asyncHelper(input: input, expected: expected)
    }
    func test_002() {
        let input: [Any] = [[9], 1]
        let expected: [[Int]] = []
        asyncHelper(input: input, expected: expected)
    }
    func test_003() {
        let input: [Any] = [[1, 2, 3], 6]
        let expected: [[Int]] = [[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 2], [1, 1, 1, 3], [1, 1, 2, 2], [1, 2, 3], [2, 2, 2], [3, 3]]
        asyncHelper(input: input, expected: expected)
    }
    private func asyncHelper(input  input: [Any], expected: [[Int]]) {
        weak var expectation: XCTestExpectation? = self.expectationWithDescription(Medium_039_Combination_Sum_Test.TimeOutName)
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
            var result: [[Int]] = Medium_039_Combination_Sum.combinationSum(candidates: input[0] as! [Int], target: input[1] as! Int)
            if result.count != expected.count {
                assertHelper(false, problemName: Medium_039_Combination_Sum_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
            } else {
                for var i = 0; i < expected.count; i++ {
                    var flag: Bool = false
                    for var j = 0; j < result.count; j++ {
                        if expected[i] == result[j] {
                            flag = true
                        }
                    }
                    if flag == false {
                        assertHelper(false, problemName: Medium_039_Combination_Sum_Test.ProblemName, input: input, resultValue: result, expectedValue: expected)
                        return
                    }
                }
            }
            if let unwrapped = expectation {
                unwrapped.fulfill()
            }
        })
        waitForExpectationsWithTimeout(Medium_039_Combination_Sum_Test.TimeOut) { (error: NSError!) -> Void in
            if error != nil {
                assertHelper(false, problemName: Medium_039_Combination_Sum_Test.ProblemName, input: input, resultValue: Medium_039_Combination_Sum_Test.TimeOutName, expectedValue: expected)
            }
        }
    }
}
