import XCTest
@testable import IfFormula

final class IfFormula_swiftTests: XCTestCase {
    func testResultIf() throws {
        XCTContext.runActivity(named: "if") { _ in
            do {
                let result = resultIf(true) {
                    1
                }.end()
                
                XCTAssertEqual(result, 1)
            }
            
            do {
                let result = resultIf(false) {
                    1
                }.end()
                
                XCTAssertEqual(result, nil)
            }
        }
        
        XCTContext.runActivity(named: "if-else") { _ in
            do {
                let result = resultIf(true) {
                    1
                }.else {
                    2
                }.end()
                
                XCTAssertEqual(result, 1)
            }
            
            do {
                let result = resultIf(false) {
                    1
                }.else {
                    2
                }.end()
                
                XCTAssertEqual(result, 2)
            }
        }
        
        XCTContext.runActivity(named: "if-elseIf") { _ in
            do {
                let result = resultIf(true) {
                    1
                }.elseIf(true) {
                    2
                }.end()
                
                XCTAssertEqual(result, 1)
            }
            
            do {
                let result = resultIf(true) {
                    1
                }.elseIf(false) {
                    2
                }.end()
                
                XCTAssertEqual(result, 1)
            }
            
            do {
                let result = resultIf(false) {
                    1
                }.elseIf(true) {
                    2
                }.end()
                
                XCTAssertEqual(result, 2)
            }
            
            do {
                let result = resultIf(false) {
                    1
                }.elseIf(false) {
                    2
                }.end()
                
                XCTAssertEqual(result, nil)
            }
        }
        
        XCTContext.runActivity(named: "if-elseIf-else") { _ in
            do {
                let result = resultIf(true) {
                    1
                }.elseIf(true) {
                    2
                }.else {
                    3
                }.end()
                
                XCTAssertEqual(result, 1)
            }
            
            do {
                let result = resultIf(true) {
                    1
                }.elseIf(false) {
                    2
                }.else {
                    3
                }.end()
                
                XCTAssertEqual(result, 1)
            }
            
            do {
                let result = resultIf(false) {
                    1
                }.elseIf(true) {
                    2
                }.else {
                    3
                }.end()
                
                XCTAssertEqual(result, 2)
            }
            
            do {
                let result = resultIf(false) {
                    1
                }.elseIf(false) {
                    2
                }.else {
                    3
                }.end()
                
                XCTAssertEqual(result, 3)
            }
        }
    }
}
